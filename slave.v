

module slave(
  input reset,
  input ss,
  input sck,
  input cpol,
  input cpoh,
  input MOSI, 
  input [7:0] reg1,
  input [7:0] reg2,
  input [7:0] reg3,
  input [7:0] reg4,
  input [7:0] reg5,
  input [7:0] reg6,
  input [7:0] reg7,
  input [7:0] reg8,  
  output MISO 

  );
  
  localparam idle=3'b000;
   localparam receive=3'b001; 
  localparam  send=3'b010;
 
   
  localparam reg1add=8'b00000001;
  localparam reg2add=8'b00000010;
  localparam reg3add=8'b00000011;
   localparam reg4add=8'b00000100;
  localparam reg5add=8'b00000101;
  localparam reg6add=8'b00000110;
   localparam reg7add=8'b00000111;
  localparam reg8add=8'b00001000;
 
  
 
reg [2:0] counts1;
wire [2:0] counts_next1; //3shan btktb feh bara always
reg [3:0] countr1;
wire [3:0] countr_next1;
reg [7:0] dr1;
wire  dr_next1;
reg [2:0] state_reg11;
wire [2:0] state_next11;
reg [2:0] state_reg12;
wire [2:0] state_next12;
///////////
reg [2:0] counts2;
wire [2:0] counts_next2; //3shan btktb feh bara always
reg [3:0] countr2;
wire [3:0] countr_next2;
reg [7:0] dr2;
wire  dr_next2;
reg [2:0] state_reg21;
wire [2:0] state_next21;
reg [2:0] state_reg22;
wire [2:0] state_next22;
wire [7:0] dtosend1;
wire [7:0] dtosend2;

wire MISO1;
wire MISO2;
wire [7:0] ds1;
wire [7:0] ds2;


  always @(posedge sck, posedge reset) //sequential of sending
  begin
     if(reset) begin
      state_reg11<=idle;
      state_reg12<=idle;
       counts1<=0;
       countr1<=0;
       dr2<=9'bz;
     
      
      
   end
     else
       begin
         state_reg11<=state_next11;
         state_reg12<=state_next12;
         counts1<=counts_next1;
          dr2[countr2]<=dr_next2;
         countr1<=countr_next1;
        
        
         
       end
 end 
 
 
 
 ///////
  always @(negedge sck, posedge reset) //sequential of sending
  begin
     if(reset) begin
       state_reg21<=idle;
       state_reg22<=idle;
       counts2<=0;
       countr2<=0;
       dr1<=9'bz;
      
       
       
   end
     else
       begin
         state_reg21<=state_next21;
        state_reg22<=state_next22;
         counts2<=counts_next2;
          dr1[countr1]<=dr_next1;
         countr2<=countr_next2;
        
         
       end
 end 
 
 

    
    //combinational of sending
    //////////////
    ////state_reg assignment///
    assign state_next11=(state_reg11==idle & ss==1'b0)?idle:
                        (state_reg11==idle & ss==1'b1)?receive:
                        (state_reg11==receive & countr1<7)?receive:idle;                  
                
                    
            ////////
   assign state_next12= (state_reg12==idle & countr1==8)?send:
		                    (state_reg12==send & countr1==8)? send:
                        (state_reg12==send & counts1<7)?send:idle;
                       
   assign state_next21= (state_reg21==idle & ss==1'b0)?idle:
                        (state_reg21==idle & ss==1'b1)?receive:
                        (state_reg21==receive & countr2<7)?receive:idle;                    
                       
    assign state_next22=(state_reg22==idle & countr2==8)?send:
 			                  (state_reg22==send & countr2==8)? send:
                        (state_reg22==send & counts2<7)?send:idle;                       
                       
  ////////count_next assignement//////
    assign counts_next1=((state_reg12==send & counts1<8 ) )?counts1+1:3'b000;
    assign countr_next1=((state_reg11==receive & countr1<8))?countr1+1:4'b0 ;
    
    assign counts_next2=(state_reg22==send & counts2<8)?counts2+1:3'b000;
    assign countr_next2=((state_reg21==receive & countr2<8))?countr2+1:4'b0 ;
    
      
    
    /////////////////////
    
    assign dr_next1=(state_reg11==receive || (state_reg11==idle & ss==1'b1))?MOSI:dr1[countr1];
    assign dr_next2=(state_reg21==receive || (state_reg21==idle & ss==1'b1))?MOSI:dr2[countr2];
    
    
    assign ds1=
               (dr1[7:0]==reg1add )?reg1:
               (dr1[7:0]==reg2add )?reg2:
               (dr1[7:0]==reg3add )?reg3:
               (dr1[7:0]==reg4add )?reg4:
               (dr1[7:0]==reg5add )?reg5:
               (dr1[7:0]==reg6add )?reg6:
               (dr1[7:0]==reg7add )?reg7:
               (dr1[7:0]==reg8add )?reg8:ds1;
                          
                          
  assign  ds2=
              (dr2[7:0]==reg1add )?reg1:
              (dr2[7:0]==reg2add )?reg2:
              (dr2[7:0]==reg3add )?reg3:
              (dr2[7:0]==reg4add)?reg4:
              (dr2[7:0]==reg5add)?reg5:
              (dr2[7:0]==reg6add)?reg6:
              (dr2[7:0]==reg7add)?reg7:
              (dr2[7:0]==reg8add)?reg8:ds2;
    
  
    assign dtosend1=(countr1==8)?ds1:dtosend1;
    assign dtosend2=(countr2==8)?ds2:dtosend2;
    
    
     
     
     
     assign MISO1=(state_reg12==idle)?1'bz: 
                  (state_reg12==send & counts1<8)?dtosend1[counts1]:1'bz;
                  
     assign MISO2=(state_reg22==idle)?1'bz: 
                  (state_reg22==send & counts2<8)?dtosend2[counts2]:1'bz;
  
     assign MISO=((cpol ^ cpoh))? MISO2:MISO1;
         
    
endmodule

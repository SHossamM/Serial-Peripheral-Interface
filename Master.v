module Master(
  input clk,
  input reset,
  input sendOrder,
  input [1:0] ssi,
  input [7:0] address,
  input MISO,
  input cpol,
  input cpoh,
  output MOSI,
  output [7:0] sensor,
  output ss1,
  output ss2,
  output ss3,
  output sck
  );

  reg sc1;
  reg sc2;
  reg sc3;
  reg sc4;
  localparam idle=3'b000;
  localparam  send=3'b001;
  localparam receive=3'b010;
  localparam delay=3'b011;
  
 wire [7:0] sensor1 ; 
 wire [7:0] sensor2 ; 
 wire [7:0] sensor3 ;  
 wire [7:0] sensor4 ;   
 
 wire  mosi1 ; 
 wire  mosi2 ; 
 wire  mosi3 ;  
 wire  mosi4 ;
 
 wire ss11 ;
 wire ss12 ;
 wire ss13 ;
 wire ss21 ;
 wire ss22 ;
 wire ss23 ;
 wire ss31 ;
 wire ss32 ;
 wire ss33 ;
 wire ss41 ;
 wire ss42 ;
 wire ss43 ;
  
reg [7:0] ds1;
wire [7:0] ds_next1; //3shan a5ly kolo comb.
reg [2:0] counts1;
wire [2:0] counts_next1; //3shan btktb feh bara always
reg [2:0] countr1;
wire [2:0] countr_next1;
reg [7:0] dr1;
wire  dr_next1;


reg [2:0] state_reg11;
wire [2:0] state_next11;
reg [2:0] state_reg12;
wire [2:0] state_next12;
reg [3:0] countsen1;
wire [3:0] countsen_next1;
///////////
reg [7:0] ds2;
wire [7:0] ds_next2; 
reg [2:0] counts2;
wire [2:0] counts_next2; 
reg [2:0] countr2;
wire [2:0] countr_next2;
reg [7:0] dr2;
wire  dr_next2;

reg [2:0] state_reg21;
wire [2:0] state_next21;

reg [2:0] state_reg22;
wire [2:0] state_next22;

reg [3:0] countsen2;
wire [3:0] countsen_next2;

//////
reg [7:0] ds3;
wire [7:0] ds_next3; 
reg [2:0] counts3;
wire [2:0] counts_next3; 
reg [2:0] countr3;
wire [2:0] countr_next3;
reg [7:0] dr3;
wire  dr_next3;
reg [2:0] state_reg31;
wire [2:0] state_next31;
reg [2:0] state_reg32;
wire [2:0] state_next32;
reg [3:0] countsen3;
wire [3:0] countsen_next3;
//////
reg [7:0] ds4;
wire [7:0] ds_next4; 
reg [2:0] counts4;
wire [2:0] counts_next4;
reg [2:0] countr4;
wire [2:0] countr_next4;
reg [7:0] dr4;
wire  dr_next4;
reg [2:0] state_reg41;
wire [2:0] state_next41;
reg [2:0] state_reg42;
wire [2:0] state_next42;

reg [3:0] countsen4;
wire [3:0] countsen_next4;
////////


  always @( clk , posedge reset)
  begin 
    if(reset)
      begin
     sc1<=1'b0;
      sc2<=1'b0;
      sc3<=1'b1;
      sc4<=1'b1;
     
  end
else
  begin
    
    sc1<=~sc1;
    sc2<=~sc2;
    sc3<=~sc3;
    sc4<=~sc4;
    
  end
  end

  always @(posedge sc1, posedge reset) //sequential of sending
  begin
     if(reset) begin
      
       state_reg11<=idle;
       state_reg12<=idle;
       counts1<=0;
       ds1<=8'b11111111;
       countr1<=0;
       dr1<=8'bz;
       countsen1<=4'b0;
   end
     else
       begin
         state_reg11<=state_next11;
         state_reg12<=state_next12;
         
         counts1<=counts_next1;
         ds1<=ds_next1;
         dr1[countr1]<=dr_next1;
         countr1<=countr_next1;
         countsen1<=countsen_next1;
         
         
         
       end
 end 
 
 ///////
  always @(negedge sc2, posedge reset) //sequential of sending
  begin
     if(reset) begin
      
       state_reg21<=idle;
       state_reg22<=idle;
       
       counts2<=0;
       ds2<=8'b11111111;
       countr2<=0;
       dr2<=8'bz;
       countsen2<=4'b0;
      
   end
     else
       begin
         state_reg21<=state_next21;
         state_reg22<=state_next22;
         counts2<=counts_next2;
         ds2<=ds_next2;
         countr2<=countr_next2;
         dr2[countr2]<=dr_next2;
         countsen2<=countsen_next2;
         
       end
 end 
 
 /////////////
  always @(negedge sc3, posedge reset) //sequential of sending
  begin
     if(reset) begin
       
       state_reg31<=idle;
       state_reg32<=idle;
       counts3<=0;
       ds3<=8'b11111111;
       countr3<=0;
       dr3<=8'bz;
       countsen3<=4'b0;
       
   end
     else
       begin
         state_reg31<=state_next31;
          state_reg32<=state_next32;
         counts3<=counts_next3;
         ds3<=ds_next3;
         countr3<=countr_next3;
         dr3[countr3]<=dr_next3;
         countsen3<=countsen_next3;
         
       end
 end 
 ////////
  always @(posedge sc4, posedge reset) //sequential of sending
  begin
     if(reset) begin
       
       state_reg41<=idle;
       state_reg42<=idle;
       
       
       counts4<=0;
       ds4<=8'b11111111;
       countr4<=0;
       dr4<=8'bz;
       countsen4<=4'b0;
   end
     else
       begin
         state_reg41<=state_next41;
         state_reg42<=state_next42;
         
         counts4<=counts_next4;
         ds4<=ds_next4;
         countr4<=countr_next4;
         dr4[countr4]<=dr_next4;
         countsen4<=countsen_next4;
         
       end
 end 
    
    //combinational of sending
    //////////////
    ////state_reg assignment///
   assign state_next11=(state_reg11==idle & sendOrder==1'b0)?idle:
                      (state_reg11==idle & sendOrder==1'b1)?send:
                      (state_reg11==send & counts1<7)?send:                     
                      (state_reg11==send & counts1==7 )?delay: 
                      (state_reg11==delay & sendOrder==1'b1)?send:idle;
                                           
                      
                      
                      
 assign state_next12=(state_reg11==delay)?receive:
                     (state_reg12==receive & countr1<7)?receive:idle;                     
                    
                      
                      
                      
                      
                      
assign state_next21=(state_reg21==idle & sendOrder==1'b0)?idle:
                      (state_reg21==idle & sendOrder==1'b1)?send:
                      (state_reg21==send & counts1<7)?send: 
                      (state_reg21==send & counts1==7 )?delay:                  
                      (state_reg21==delay & sendOrder==1'b1)?send: idle;
                      
                      
                      
  assign state_next22=(state_reg21==delay)?receive:
                     (state_reg22==receive & countr1<7)?receive:idle;                     
                    

                      
                      
                
  assign state_next31=(state_reg31==idle & sendOrder==1'b0)?idle:
                      (state_reg31==idle & sendOrder==1'b1)?send:
                      (state_reg31==send & counts1<7)?send:                     
                      (state_reg31==send & counts1==7)?delay:                  
                      (state_reg31==delay & sendOrder==1'b1)?send: idle;
                      
                      
                      
  assign state_next32=(state_reg31==delay)?receive:
                     (state_reg32==receive & countr1<7)?receive:idle;   
                      
                      
  assign state_next41=(state_reg41==idle & sendOrder==1'b0)?idle:
                      (state_reg41==idle & sendOrder==1'b1)?send:
                      (state_reg41==send & counts1<7)?send:                     
                      (state_reg41==send & counts1==7 )?delay:                  
                      (state_reg41==delay & sendOrder==1'b1)?send: idle;
                      
                      
                      
  assign state_next42=(state_reg41==delay)?receive:
                     (state_reg42==receive & countr1<7)?receive:idle;   
                      


                     
  ////////count_next assignement//////
    assign counts_next1=(state_reg11==send & counts1<8)?counts1+1:3'b000;
    assign countr_next1=(state_reg12==receive & countr1<8)?countr1+1:3'b000 ;
    assign countsen_next1=(state_reg12==receive)?countsen1+1:4'b0; //e7tmal ydrb hna :)
     
    assign counts_next2=(state_reg21==send & counts2<8)?counts2+1:3'b000;
    assign countr_next2=(state_reg22==receive & countr2<8)?countr2+1:3'b000 ;
    assign countsen_next2=(state_reg22==receive)?countsen2+1:4'b0;
          
    assign counts_next3=(state_reg31==send & counts3<8)?counts3+1:3'b000;
    assign countr_next3=(state_reg32==receive & countr3<8)?countr3+1:3'b000 ;
    assign countsen_next3=(state_reg32==receive)?countsen3+1:4'b0;
          
    assign counts_next4=(state_reg41==send & counts4<8)?counts4+1:3'b000;
    assign countr_next4=(state_reg42==receive & countr4<8)?countr4+1:3'b000 ;
    assign countsen_next4=(state_reg42==receive)?countsen4+1:4'b0;
    
    /////////////////////
    
    assign sensor1=(countsen1<8)?8'bz:(countsen1==8)?dr1:sensor1;
    assign sensor2=(countsen2<8)?8'bz:(countsen2==8)?dr2:sensor2;
    assign sensor3=(countsen3<8)?8'bz:(countsen3==8)?dr3:sensor3;
    assign sensor4=(countsen4<8)?8'bz:(countsen4==8)?dr4:sensor4;
    assign sensor=(cpol==0 & cpoh==0)?sensor1:(cpol==0 & cpoh==1)?sensor1:(cpol==1 & cpoh==0)?sensor3:sensor1;
        
    assign ds_next1=((state_reg11==delay & sendOrder==1)|| (state_reg11==idle & sendOrder==1) )?address:ds1; 
    assign ds_next2=((state_reg21==delay & sendOrder==1)|| (state_reg21==idle & sendOrder==1) )?address:ds2;
    assign ds_next3=((state_reg31==delay & sendOrder==1)|| (state_reg31==idle & sendOrder==1) )?address:ds3;
    assign ds_next4=((state_reg41==delay & sendOrder==1)|| (state_reg41==idle & sendOrder==1) )?address:ds4;
        
    assign dr_next1=(state_reg12==receive)?MISO:1'bz;
    assign dr_next2=(state_reg22==receive)?MISO:1'bz;
    assign dr_next3=(state_reg32==receive)?MISO:1'bz;
    assign dr_next4=(state_reg42==receive)?MISO:1'bz;
      
    assign mosi1=(state_reg11==idle)?1'b1: 
                 (state_reg11==send &counts1<8)?ds1[counts1]:1'b1;
    assign mosi2=(state_reg21==idle)?1'b1: 
                 ((state_reg21==send &counts2<8) || (state_reg21==delay & counts2<8))?ds2[counts2]:1'b1;
    assign mosi3=(state_reg31==idle)?1'b1: 
                 (state_reg31==send &counts3<8  )?ds3[counts3]:1'b1;
    assign mosi4=(state_reg41==idle)?1'b1: 
                 ((state_reg41==send &counts4<8) || (state_reg21==delay & counts2<8))?ds4[counts4]:1'b1;
    assign MOSI=(cpol==0 & cpoh==0)?mosi1:(cpol==0 & cpoh==1)?mosi2:(cpol==1 & cpoh==0)?mosi3:mosi4;
                
    assign ss11=((state_reg11==send || sendOrder==1'b1) & ssi==2'b01 )?1'b1:1'b0;
    assign ss12=((state_reg11==send || sendOrder==1'b1) & ssi==2'b10 )?1'b1:1'b0;
    assign ss13=((state_reg11==send || sendOrder==1'b1) & ssi==2'b11 )?1'b1:1'b0;
    
    assign ss21=((state_reg21==send || sendOrder==1'b1) & ssi==2'b 01 )?1'b1:1'b0;
    assign ss22=((state_reg21==send || sendOrder==1'b1) & ssi==2'b 10 )?1'b1:1'b0;
    assign ss23=((state_reg21==send || sendOrder==1'b1) & ssi==2'b 11 )?1'b1:1'b0;
    
    assign ss31=((state_reg31==send || sendOrder==1'b1) & ssi==2'b 01 )?1'b1:1'b0;
    assign ss32=((state_reg31==send || sendOrder==1'b1) & ssi==2'b 10 )?1'b1:1'b0;
    assign ss33=((state_reg31==send || sendOrder==1'b1) & ssi==2'b 11 )?1'b1:1'b0;
        
    assign ss41=((state_reg41==send || sendOrder==1'b1) & ssi==2'b 01 )?1'b1:1'b0;
    assign ss42=((state_reg41==send || sendOrder==1'b1) & ssi==2'b 10 )?1'b1:1'b0;
    assign ss43=((state_reg41==send || sendOrder==1'b1) & ssi==2'b 11 )?1'b1:1'b0;
    
    assign ss1=(cpol==0 & cpoh==0)?ss11:(cpol==0 & cpoh==1)?ss21:(cpol==1 & cpoh==0)?ss31:ss41;
    assign ss2=(cpol==0 & cpoh==0)?ss12:(cpol==0 & cpoh==1)?ss22:(cpol==1 & cpoh==0)?ss32:ss42;
    assign ss3=(cpol==0 & cpoh==0)?ss13:(cpol==0 & cpoh==1)?ss23:(cpol==1 & cpoh==0)?ss33:ss43;
    ////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////
    
    assign sck=(cpol==0 & cpoh==0)?sc1:(cpol==0 & cpoh==1)?sc2:(cpol==1 & cpoh==0)?sc3:sc4; //generate clock
    
    
endmodule



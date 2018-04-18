

module Master_tb();
  reg clk;
  reg reset;
  reg sendOrder;
  reg [1:0] ssi;
  reg [7:0] address;
  reg MISO;
  reg cpol;
  reg cpoh;
  wire MOSI;
  wire [7:0] sensor;
  wire ss1;
  wire ss2;
  wire ss3;
  wire sck;
  
reg [7:0] data;
  localparam period=10;
  always 
    begin 
      #(period/2) clk=~clk;
    end
    
   
Master M(clk,reset,sendOrder,ssi,address,MISO,cpol,cpoh,MOSI,sensor,ss1,ss2,ss3,sck);
	
    initial begin
      //reseting the module
	data=8'h4c;
	clk=0;
	reset=1'b1;
	cpol=1'b0;
	cpoh=1'b0;
	sendOrder=1'b0;
	ssi=2'b00;

	

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b01;
        address=8'b00000011;
      
	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];

	#(period*2)
	sendOrder=1'b1;
	data=8'h88;
        ssi=2'b10;
        address=8'b00000010;

	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];
//end of mode 00
	#(period*2)
	reset=1'b1;
	cpol=1'b0;
	cpoh=1'b1;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00001000;
	data=8'h77;

	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];
//end of mode 01
	#(period*2)
	reset=1'b1;
	cpol=1'b1;
	cpoh=1'b0;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00000001;
	data=8'h20;

	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	sendOrder=1'b1;
        address=8'b00000011;
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	sendOrder=1'b0;
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];

	#(period*5)
	data=8'h02;
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	sendOrder=1'b1;
        address=8'b00000011;
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	sendOrder=1'b0;
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];

//end of mode 10
	#(period*2)
	reset=1'b1;
	cpol=1'b1;
	cpoh=1'b1;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00000111;
	data=8'h33;

	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	MISO=data[0];
	#(period*1)
	MISO=data[1];
	#(period*1)
	MISO=data[2];
	#(period*1)
	MISO=data[3];
	#(period*1)
	MISO=data[4];
	#(period*1)
	MISO=data[5];
	#(period*1)
	MISO=data[6];
	#(period*1)
	MISO=data[7];
//end of mode 11

      


	
    end
       initial begin
        $display ("time\t reset\t SendOrder\t ssi\t  address\t MISO\t cpol\t cpoh\t MOSI\t sensor\t ss1\t ss2\t ss3\t sck");	
        $monitor ("%g\t %h\t %h\t %h\t\t    %h\t  %h\t   %h\t   %h\t  %h\t  %h\t %h\t %h\t  %h\t   %h\t", 
  	         $time,reset,sendOrder,ssi,address,MISO,cpol,cpoh,MOSI,sensor,ss1,ss2,ss3,sck);
      
     end
       
  endmodule
  
      
      


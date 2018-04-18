

module Slave_tb();
  reg reset;
  reg ss;
  reg sck;
  reg cpol;
  reg cpoh;
  reg MOSI;
  reg [7:0] reg1;
  reg [7:0] reg2;
  reg [7:0] reg3;
  reg [7:0] reg4;
  reg [7:0] reg5;
  reg [7:0] reg6;
  reg [7:0] reg7;
  reg [7:0] reg8;  
  wire MISO;
  
  reg [7:0] data;
  localparam period=10;
  always 
    begin 
      #(period/2) sck=~sck;
    end
    
  
slave S1(reset,ss,sck,cpol,cpoh,MOSI,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,MISO);
	
    initial begin
      //reseting the module
	data=8'h02;
	sck=0;
	MOSI=1;
	reset=1'b1;
	cpol=1'b0;
	cpoh=1'b0;
	ss=1'b0;

	reg1=8'h66;
	reg2=8'h42;
	reg3=8'h4c;
	reg4=8'h13;
	reg5=8'h08;
	reg6=8'hab;
	reg7=8'h8a;
	reg8=8'hc8;	

	#(period*3.5)
        reset=1'b0;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;

	#(period*12)
	data=8'h08;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;

//end of mode 00
	#(period*12)
	sck=0;
	reset=1'b1;
	cpol=1'b0;
	cpoh=1'b1;
	data=8'h03;

	#(period*2.5)
        reset=1'b0;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;

//end of mode 01
	#(period*12)
	reset=1'b1;
	sck=1;
	cpol=1'b1;
	cpoh=1'b0;

	data=8'h06;

	#(period*3)
        reset=1'b0;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;

	#(period*1)
	data=8'h03;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;


//end of mode 10
	#(period*12)
	reset=1'b1;
	sck=1;
	cpol=1'b1;
	cpoh=1'b1;

	data=8'h05;

	#(period*3.5)
        reset=1'b0;
        ss=1'b1;

	MOSI=data[0];
	#(period*1)
	MOSI=data[1];
	#(period*1)
	MOSI=data[2];
	#(period*1)
	MOSI=data[3];
	#(period*1)
	MOSI=data[4];
	#(period*1)
	MOSI=data[5];
	#(period*1)
	MOSI=data[6];
	#(period*1)
	MOSI=data[7];
        ss=1'b0;
	#(period*1)
	MOSI=1;
      
//end of mode 11

      


	
    end
       initial begin
        $display ("time\t reset\t ss\t sck\t  cpol\t cpoh\t MOSI\t reg1\t reg2\t reg3\t reg4\t reg5\t reg6\t reg7\t reg8\t MISO");	
        $monitor ("%g\t %h\t %h\t %h\t    %h\t  %h\t   %h\t   %h\t  %h\t  %h\t %h\t %h\t  %h\t   %h\t %h\t %h\t", 
  	         $time,reset,ss,sck,cpol,cpoh,MOSI,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,MISO);
      
     end
       
  endmodule
  
      
      


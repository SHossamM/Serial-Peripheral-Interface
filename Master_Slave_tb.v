


module master_slave_tb();
  reg clk;
  reg reset;
  reg sendOrder;
  reg [1:0] ssi;
  reg [7:0] address;
  reg [1:0] mode;
  wire [7:0] sensor;

  reg [7:0] reg11;
  reg [7:0] reg21;
  reg [7:0] reg31;
  reg [7:0] reg41;
  reg [7:0] reg51;
  reg [7:0] reg61;
  reg [7:0] reg71;
  reg [7:0] reg81;

  reg [7:0] reg12;
  reg [7:0] reg22;
  reg [7:0] reg32;
  reg [7:0] reg42;
  reg [7:0] reg52;
  reg [7:0] reg62;
  reg [7:0] reg72;
  reg [7:0] reg82;

  reg [7:0] reg13;
  reg [7:0] reg23;
  reg [7:0] reg33;
  reg [7:0] reg43;
  reg [7:0] reg53;
  reg [7:0] reg63;
  reg [7:0] reg73;
  reg [7:0] reg83;

  localparam period=10;
  always 
    begin 
      #(period/2) clk=~clk;
    end
    
    Master_Slave ms(mode,reset,clk,sendOrder,ssi,address,reg11,reg21,reg31,reg41,reg51,reg61,reg71,reg81,reg12,reg22,reg32,reg42,reg52,reg62,reg72,reg82,reg13,reg23,reg33,reg43,reg53,reg63,reg73,reg83,sensor);
	
    initial begin
      //reseting the module
	clk=0;
	reset=1'b1;
	mode=2'b00;
	sendOrder=1'b0;
	ssi=2'b01;

	reg11=8'h66;
	reg21=8'h42;
	reg31=8'h4c;
	reg41=8'h13;
	reg51=8'h08;
	reg61=8'hab;
	reg71=8'h8a;
	reg81=8'hc8;

	reg12=8'h32;
	reg22=8'h51;
	reg32=8'hd0;
	reg42=8'h77;
	reg52=8'h88;
	reg62=8'h9b;
	reg72=8'h0a;
	reg82=8'hc0;

	reg13=8'h49;
	reg23=8'h61;
	reg33=8'hb2;
	reg43=8'h59;
	reg53=8'h68;
	reg63=8'h02;
	reg73=8'h6a;
	reg83=8'h12;
//first slave address 3
	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b01;
        address=8'b00000011;
      
	#(period*2)
	sendOrder=1'b0;
//second slave address 2
	#(period*16)
	sendOrder=1'b1;
        ssi=2'b10;
        address=8'b00000010;

	#(period*2)
	sendOrder=1'b0;
//end of mode 00
	#(period*16)
	reset=1'b1;
	mode=2'b01;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00001000;

	#(period*2)
	sendOrder=1'b0;
//end of mode 01
	#(period*16)
	reset=1'b1;
	mode=2'b10;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00000001;

	#(period*2)
	sendOrder=1'b0;

	#(period*8)
	sendOrder=1'b1;
        address=8'b00000011;

	#(period*2)
	sendOrder=1'b0;

//end of mode 10
	#(period*30)
	reset=1'b1;
	mode=2'b11;

	#(period*2)
        reset=1'b0;
        sendOrder=1'b1;
        ssi=2'b11;
        address=8'b00000111;

	#(period*2)
	sendOrder=1'b0;
//end of mode 11

      


	
    end
       initial begin
        $display ("time\t reset\t mode\t SendOrder\t ssi\t  address\t sensor\t reg11\t reg21\t  reg31\t   reg12\t reg22\t reg32\t reg13\t reg23\t reg33\t reg73\t reg83\t");	
      $monitor ("%g\t %h\t %h\t %h\t    %h\t  %h\t   %h\t   %h\t  %h\t  %h\t %h\t %h\t  %h\t   %h\t %h\t  %h\t   %h\t  %h\t", 
  	  $time, reset,mode,sendOrder,ssi, address,sensor,reg11,reg21,reg31,reg12,reg22,reg32,reg13,reg23,reg33,reg73,reg83);	
      
     end
       
  endmodule
  
      
      


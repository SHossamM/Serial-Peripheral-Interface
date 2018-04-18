
module Master_Slave(
input [1:0] mode,
input reset,
input clk,
input sendOrder,
input [1:0] ssi,
input [7:0] address,
input [7:0] reg11,
input [7:0] reg21,
input [7:0] reg31,
input [7:0] reg41,
input [7:0] reg51,
input [7:0] reg61,
input [7:0] reg71,
input [7:0] reg81,
input [7:0] reg12,
input [7:0] reg22,
input [7:0] reg32,
input [7:0] reg42,
input [7:0] reg52,
input [7:0] reg62,
input [7:0] reg72,
input [7:0] reg82,
input [7:0] reg13,
input [7:0] reg23,
input [7:0] reg33,
input [7:0] reg43,
input [7:0] reg53,
input [7:0] reg63,
input [7:0] reg73,
input [7:0] reg83,
output [7:0] sensor
 
);
wire cpol ;
wire cpoh ;
wire MISO ;
wire MISO1 ;
wire MISO2 ;
wire MISO3 ;
wire MOSI ;
wire ss1 ;
wire ss2 ;
wire ss3 ;

assign cpol=(mode==2'b0)?1'b0:(mode == 2'b01)?1'b0:(mode ==2'b10)?1'b1:1'b1 ;
assign cpoh=(mode==2'b0)?1'b0:(mode==2'b01)?1'b1:(mode==2'b10)?1'b0:1'b1 ;
assign MISO=(ssi==2'b01)?MISO1:(ssi==2'b10)?MISO2:(ssi==2'b11)?MISO3:MISO1;
Master M(clk,reset,sendOrder,ssi,address,MISO,cpol,cpoh,MOSI,sensor,ss1,ss2,ss3,sck);
slave S1(reset, ss1,sck, cpol,cpoh,MOSI,reg11,reg21,reg31,reg41,reg51,reg61,reg71,reg81,MISO1);
slave S2(reset, ss2,sck, cpol,cpoh,MOSI,reg12,reg22,reg32,reg42,reg52,reg62,reg72,reg82,MISO2);
slave S3(reset, ss3,sck, cpol,cpoh,MOSI,reg13,reg23,reg33,reg43,reg53,reg63,reg73,reg83,MISO3);
endmodule




`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: instructionRegister
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instructionRegister( input logic[11:0] readData, output logic[11:0] outData, input logic clk );
	
	//readData is fetched data from the instruction memory.
	//output data is the data to be transferred into controller.
	
	always_ff@ (posedge clk) 
		 outData <= readData;
endmodule

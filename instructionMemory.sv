`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory( readAddr, readData);

	input logic[2:0] readAddr;		// read address
	output logic[11:0] readData;	// data to be read
	
	//input clk;
	
	reg[11:0] ReadOnlyMemory[7:0]; 	// read only memory 
	
	initial begin
//		ReadOnlyMemory[0] = ---------------;
//		ReadOnlyMemory[1] = ---------------;
//		ReadOnlyMemory[2] = ---------------;
//		ReadOnlyMemory[3] = ---------------;
//		ReadOnlyMemory[4] = ---------------;
//		ReadOnlyMemory[5] = ---------------;
//		ReadOnlyMemory[6] = ---------------;
//		ReadOnlyMemory[7] = ---------------;
	end
	
	
	assign readData = ReadOnlyMemory[readAddr];
	
endmodule

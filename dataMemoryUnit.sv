`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: dataMemoryUnit
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


module dataMemoryUnit( D_addr, D_rd, D_wr, W_data, R_data, clk );
	
	input logic[3:0] D_addr; 			// data address
	input logic D_rd; 					// data raed select
	input logic D_wr; 					// data write select
	input logic[3:0] W_data;			// data to write
	output logic[3:0] R_data;			// data to be read
	
	input clk;
	
	reg [3:0] D[15:0];  				// memory component 
	
	// intitial values assigned
	initial begin
		
		D[0] = 4'b0000;
		D[1] = 4'b0001;
		D[2] = 4'b0010;
		D[3] = 4'b0011;
		D[4] = 4'b0100;
		D[5] = 4'b0101;
		D[6] = 4'b0110;
		D[7] = 4'b0111;
		D[8] = 4'b1000;
		D[9] = 4'b1001;
		D[10] = 4'b1010;
		D[11] = 4'b1011;
		D[12] = 4'b1100;
		D[13] = 4'b1101;
		D[14] = 4'b1110;
		D[15] = 4'b1111;
		
	end
	
	// values either assigned or read at the rising edge of the clock
	always @ (posedge clk) begin 
		
		if ( D_wr && !D_rd ) 
			D[D_addr] <= W_data;
		
		if ( !D_wr && D_rd )
			R_data <= D[D_addr];
	
	end
	
endmodule

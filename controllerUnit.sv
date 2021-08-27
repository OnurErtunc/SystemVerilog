`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: controllerUnit
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


module controllerUnit ( input logic reset, input logic[11:0] irOutput, output logic[3:0] D_addr, output logic D_rd,
												output logic D_wr, output logic RF_we, output logic [2:0] RF_waddr, 
												output logic isExternal, output logic AluSel, output logic [2:0]ra,
												output logic [2:0]rb, input logic pushBtnLeft, input logic pushBtnRight,
												input logic[11:0] switches, input logic clk ); 
												
	typedef enum logic [2:0] {S0, S1, S2a, S2b, S2c, S2d, S3} statetype;
	logic [2:0] state, nextState;
	
	logic[2:0] msb;
	
	logic[11:0] tempVariable;
	
	
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else state <= nextState;
		
	
	always_comb
		case(state)
			
			S0: 						 	nextState = S1;
			
			S1: if ( msb == 3'b000 ) 		nextState = S2a; // load
				else if ( msb == 3'b001 ) 	nextState = S2b; // store
				else if ( msb == 3'b101 )	nextState = S2c; // add
				else if ( msb == 3'b110 )	nextState = S2d; // subtract
			
			S2a: 							nextState = S3;
			S2b: 							nextState = S3;
			S2c: 							nextState =  S3;
			S2d: 							nextState = S3;
			S3:                             nextState = S0;
			
			default: 						nextState = S0;
		endcase
		
	always_comb
		case(state)
			
			S0: tempVariable = pushBtnRight?switches:irOutput;
			
			S1: msb = irOutput[11:9];
			
			S2a: 
				begin 
					D_addr <= tempVariable[3:0];
					D_rd <= 1'b1;
					D_wr <= 1'b0;
					isExternal <= 1'b1;
					RF_we <= 1'b1;
					RF_waddr <= tempVariable[6:4];
				end
				
			S2b:
				begin
					D_wr <= 1'b1;
					D_rd <= 1'b0;
					isExternal <= 1'b0;
					D_addr <= tempVariable[3:0];
					RF_waddr <= tempVariable[6:4];
				end

			S2c:
				begin
					RF_we <= 1'b1;
					ra <= tempVariable[2:0];
					rb <= tempVariable[5:3];
					AluSel <= 1'b0;
					isExternal <= 1'b0;
					RF_waddr <= tempVariable[8:6];
				end
				
			S2d:
				begin
					RF_we <= 1'b1;
					ra <= tempVariable[2:0];
					rb <= tempVariable[5:3];
					AluSel <= 1'b1;
					isExternal <= 1'b0;
					RF_waddr <= tempVariable[8:6];
				end
		endcase
endmodule

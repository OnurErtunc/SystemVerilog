`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: alu
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


module alu( A, B, Sel, Res );
    input[3:0] A;
    input[3:0] B;
    input Sel;
    output logic[3:0] Res;
    
    
    always_comb
      begin 
        case(Sel)
          1'b0: Res = A - B;
          1'b1: Res = A + B;
        endcase
    end

endmodule

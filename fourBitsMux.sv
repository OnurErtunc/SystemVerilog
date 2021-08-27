`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: fourBitsMux
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


module fourBitsMux( input [3:0] a,
                    input [3:0] b,
                    input isExternal,
                    output reg [3:0] out );
        
        always @ ( a or b or isExternal ) 
            begin
                case (isExternal)
                    1'b1 : out <= a;
                    1'b0 : out <= b;
                endcase
        end
endmodule

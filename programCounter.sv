`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: programCounter
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


module programCounter( input logic[2:0] nextAddress, input logic reset, output logic[2:0] Address, input logic clk );

    initial begin 
        Address = 3'b000;
    end
    
    always @( posedge clk )
        begin 
            if (reset) Address = 3'b000;
        
            else Address <= nextAddress;
        end
endmodule

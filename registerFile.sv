`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: registerFile
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


module registerFile( reset, rda1, rda2, wra, wrd, wr_en, rdd1, rdd2, clk );
    
    input[2:0] rda1; // to read1
    input[2:0] rda2; // to read2
    input[2:0] wra; //  register number to write
    input wr_en;     // enable will be used in if
    input[3:0] wrd;  // data to write wra which will be come from mux
    input clk;
    output logic[3:0] rdd1; // output - 4 bits
    output logic[3:0] rdd2; // output - 4 bits
    input logic reset;
    reg[3:0] registerfile[7:0]; // an array of 8 registers each of 4 bits (hopefully)
    
    always @ (posedge clk) begin 
        
        if(reset) begin
            registerfile[0] =0;
            registerfile[1] =0;
            registerfile[2] =0;
            registerfile[3] =0;
            registerfile[4] =0;
            registerfile[5] =0;
            registerfile[6] =0;
            registerfile[7] =0;
         end   
        else if (wr_en)
            registerfile[wra] <= wrd;
        
        // save data stored at rda1 into rdd1
        end
        assign rdd1 = registerfile[rda1];
        
        // save data stored at rda1 into rdd1
        assign rdd2 = registerfile[rda2];
   
endmodule

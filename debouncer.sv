`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Ertunc
// 
// Create Date: 
// Design Name: 
// Module Name: debouncer
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


module debouncer(input logic clk, input logic btnL,output logic pulse);
    logic [24:0] timer;
    typedef enum logic [1:0]{S0,S1,S2,S3} states;
    states state, nextState;
    logic gotInput;
    
    always_ff@(posedge clk)
        begin    
            state <= nextState;
            if(gotInput)
                timer <= 25000000;
            else
                timer <= timer - 1;
        end
    always_comb
        case(state)
            S0: if(btnL) 
                begin //startTimer
                    nextState = S1;    
                    gotInput = 1;
                end
                else begin nextState = S0; gotInput = 0; end
            S1: begin nextState = S2; gotInput = 0; end
            S2: begin nextState = S3; gotInput = 0; end
            S3: begin if(timer == 0) nextState = S0; else nextState = S3; gotInput = 0; end
            default: begin nextState = S0; gotInput = 0; end
            endcase
    
    assign pulse = ( state == S1 );
endmodule

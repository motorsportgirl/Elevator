`timescale 1ns / 1ps

module door(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [1:0] out
    );
    
    logic [1:0] count;
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1)
            out<=0;
        else
            if(en==1)
                out<=out+1;
            else
                out<=0;
    end
endmodule

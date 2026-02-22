`timescale 1ns / 1ps

module freq_div(
    input logic clk_100MHz,
    input logic rst,
    output logic clk_2Hz
    );
    
    logic [31:0] count, count_max=1;
    
    always_ff @(posedge clk_100MHz, posedge rst) begin
        if(rst==1) begin
            count<=0;
            clk_2Hz<=0;
        end
        else begin
            if(count==count_max-1) begin
                count<=0;
                clk_2Hz<=~clk_2Hz;
            end
            else
                count<=count+1;
        end
    end
    
endmodule

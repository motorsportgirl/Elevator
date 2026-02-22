`timescale 1ns / 1ps

module floor(
    input logic clk,
    input logic rst,
    input logic sus,
    input logic jos,
    output logic [2:0] etaj_curent
    );
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1)
            etaj_curent<=0;
        else begin
            if(sus==1)
                etaj_curent<=etaj_curent+1;
            else
                if(jos==1)
                    etaj_curent<=etaj_curent-1;
        end
    end
    
endmodule

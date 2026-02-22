`timescale 1ns / 1ps

module testbench();

logic [2:0] etaj_cerut;
logic clk_100MHz, rst;
logic [7:0] out;
top inst_top(.*);

initial begin
    clk_100MHz=1;
    forever begin
        #5 clk_100MHz=~clk_100MHz;
    end
end

initial begin
    #10 rst=1;
    #10 rst=0;
    etaj_cerut=7;
    #300 etaj_cerut=0;
    #400 $stop;
end

endmodule

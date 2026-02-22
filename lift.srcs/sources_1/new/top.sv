`timescale 1ns / 1ps


module top(
    input logic clk_100MHz,
    input logic rst,
    input logic [2:0] etaj_cerut,
    output logic [7:0] out
    );
    
    logic clk_2Hz,sus,jos,en;
    logic [2:0] etaj_curent;
    logic [1:0] door_cnt_val;
    
    freq_div inst_frec(.*);
    floor inst_f(
        .clk(clk_2Hz),
        .rst(rst),
        .sus(sus),
        .jos(jos),
        .etaj_curent(etaj_curent)
    );
    
    door inst_d(
        .clk(clk_2Hz),
        .rst(rst),
        .en(en),
        .out(door_cnt_val)
    );
    
    fsm inst_fsm(
        .clk(clk_2Hz),
        .rst(rst),
        .etaj_curent(etaj_curent),
        .etaj_cerut(etaj_cerut),
        .door_cnt_val(door_cnt_val),
        .sus(sus),
        .jos(jos),
        .door_cnt_en(en)
    );
    
    onehot inst_hot(
        .in(etaj_curent),
        .out(out)
    );
endmodule

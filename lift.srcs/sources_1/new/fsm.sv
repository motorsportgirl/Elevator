`timescale 1ns / 1ps

module fsm(
    input logic clk,
    input logic rst,
    input logic [2:0] etaj_curent,
    input logic [2:0] etaj_cerut,
    input logic [1:0] door_cnt_val,
    output logic sus,
    output logic jos,
    output logic door_cnt_en
    );
    
    localparam idle=3'b000;
    localparam dc=3'b001;
    localparam md=3'b010;
    localparam mu=3'b011;
    localparam dooro=3'b100;
    logic [2:0] stare, next;
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1)
            stare<=idle;
        else
            stare<=next;
    end
    
    always_comb begin
        next=stare;
        case(stare)
            idle: begin
                    if(etaj_curent!=etaj_cerut)
                        next=dc;
                  end
            dc: begin
                    if(door_cnt_val==3)
                        if(etaj_curent>etaj_cerut)begin
                            next=md;
                            $display("VREAU SA COBOR");
                        end
                        else
                            if(etaj_curent<etaj_cerut)
                                next=mu;
                end
             md: begin 
                    if(etaj_cerut==etaj_curent-1)
                        next=dooro;
                    $display("VREAU SA COBOR");
                 end
             mu: begin 
                    if(etaj_cerut==etaj_curent+1)
                        next=dooro;
                 end
             dooro: begin
                        if(door_cnt_val==3)
                            next=idle;
                    end
        endcase
    end
    
    always_comb begin
        if(stare == idle) begin
            jos = 0;
            sus = 0;
            door_cnt_en = 0;
        end
        if(stare==mu && etaj_cerut!=etaj_curent) begin
            sus = 1;
            jos = 0;
            door_cnt_en = 0;
        end
        if(stare==md && etaj_cerut!=etaj_curent)begin
            jos = 1;
            sus = 0;
            door_cnt_en = 0;
        end
        if(stare==dooro || stare==dc) begin
            door_cnt_en=1;
            jos = 0;
            sus = 0;
        end
    end
    
endmodule

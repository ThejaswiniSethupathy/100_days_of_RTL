module down_counter (
    input clk,
    input reset,
    output reg[3:0] count
);

    always@(posedge clk) 
    begin
        if(reset)
            count<=4'b1111;
        else
            count<=count-1;
    end

endmodule

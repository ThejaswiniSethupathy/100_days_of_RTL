module counter_4bit_tb;
	reg clk, load, up, down;
	reg [3:0] data;
	wire [3:0] count;

counter_4bit uut (
    .clk(clk),
    .load(load),
    .up(up),
    .down(down),
    .data(data),
    .count(count)
);

task apply_clk;
    begin
        clk = 1'b0;
        #5 clk = 1'b1;
        #5 clk = 1'b0;
    end
endtask

initial
    begin
        clk = 1'b0;
        load = 1'b0;
        up = 1'b0;
        down = 1'b0;
        data = 4'b0000;

        load = 1'b1;
        data = 4'b1010;
        apply_clk;
        #10;

        load = 1'b0;
        up = 1'b1;
        repeat (10) apply_clk;
        #10;

        up = 1'b0;
        down = 1'b1;
        repeat (10) apply_clk;
        #10;

        $finish;
    end

endmodule

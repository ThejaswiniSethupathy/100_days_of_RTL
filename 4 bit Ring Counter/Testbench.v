module tb_ring_counter;
    reg clk;
    reg reset;
    wire [3:0] q;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;

        #5 reset = 1;
        #20 reset = 0;

        #200;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | q=%b", $time, reset, q);
    end

endmodule

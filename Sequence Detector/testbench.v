module tb_sequence_detector;
    reg clk;
    reg rst;
    reg X;
    wire Z1;

    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .X(X),
        .Z1(Z1)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        X = 0;
        
        #10 rst = 0;

        #10 X = 1;
        #10 X = 0;
        #10 X = 1;

        #10 X = 1;
        #10 X = 0;
        #10 X = 1;

        #10 X = 1;
        #10 X = 0;
        #10 X = 0;
        #10 X = 1;

        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | X=%b | Z1=%b", $time, X, Z1);
    end

endmodule

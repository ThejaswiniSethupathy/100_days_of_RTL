module tb_T_flip_flop;
	reg T;
	reg clk;
	reg rst;
	wire Q;

T_flip_flop uut (
    .T(T),
    .clk(clk),
    .rst(rst),
    .Q(Q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    // Initial state
    rst = 1; T = 0;
    #10; 
    rst = 0; 

    #10 T = 1;        // Toggle 
    #10 T = 0;        // Hold
    #10 T = 1;        // Toggle
    #10 T = 1;        // Toggle
    #10 T = 0;        // Hold
    #10 T = 1;        // Toggle 

    #20;              
    rst = 1;
    #10 rst = 0;
    #10 T = 1;
    #10 T = 0;
    
    #30 $finish;
end

initial begin
    $monitor("Time = %0d : T = %b, Q = %b, rst = %b", $time, T, Q, rst);
end

endmodule

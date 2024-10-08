module upcounter_tb;
reg clk;
reg reset;
wire [3:0] count;

upcounter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    reset = 0;
    reset = 1;
    #25;
    reset = 0;
    #100;
    reset = 1;
    #20;
    reset = 0;
    #100;
    $stop;
end

initial begin
    $monitor("Time = %0t : Count = %b", $time, count);
end

endmodule

module counter_4bit(
    input clk, load, up, down,
    input [3:0] data,
    output reg [3:0] count
);

always @(posedge clk)
    if (load)
        count <= data;
    else if (up)
        count <= count + 1;
    else if (down)
        count <= count - 1;

endmodule

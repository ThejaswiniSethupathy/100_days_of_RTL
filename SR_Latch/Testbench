module tb_sr_latch;
	reg s;
	reg r;
	wire q;
	wire qb;

sr_latch uut (
    .s(s), 
    .r(r), 
    .q(q), 
    .qb(qb)
);

initial begin
    $monitor("At time %0t: s = %b, r = %b, q = %b, qb = %b", $time, s, r, q, qb);
    s = 0; r = 0; #10;
    s = 1; r = 0; #10;
    s = 0; r = 0; #10;
    s = 0; r = 1; #10;
    s = 0; r = 0; #10;
    s = 1; r = 1; #10;
    s = 0; r = 0; #10;
    $finish;
end

endmodule

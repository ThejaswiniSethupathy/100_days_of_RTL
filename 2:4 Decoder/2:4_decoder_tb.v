`timescale 1ns / 1ps
module decoder;
	reg a;
	reg b;

	wire d0;
	wire d1;
	wire d2;
	wire d3;
	decoder uut (
		.a(a), 
		.b(b), 
		.d0(d0), 
		.d1(d1), 
		.d2(d2), 
		.d3(d3)
	);
	initial begin
		a = 0;
		b = 0;
		#20; a=0; b=1; #20;
		a=1'b1;
		b=1'b0;
		#20;
		a=1'b1;
		b=1'b1;
		#20; $finish;
	end
      
endmodule

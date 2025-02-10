module test (
);
wire clk_wire;
wire rst_wire;
wire[32-1:0] numar;
wire[32-1:0] nrsecunde;
wire impuls;
wire red;
wire green;
wire yellow;
wire redpieton;
wire greenpieton;
wire secunda;
reg button;
wire startsemafor;

clk_gen ceas(
	.clk(clk_wire),
	.rst(rst_wire)
	);
counter counter1(
	.clk  (clk_wire),
	.rst  (rst_wire),
	.numar(numar),
	.nrsecunde(nrsecunde),
	.impuls(impuls),
	.red(red),
	.green(green),
	.yellow(yellow),
	.redpieton(redpieton),
	.greenpieton(greenpieton),
	.startsemafor(startsemafor),
	.secunda(secunda),
	.button(button)
	);

initial begin
        // Rulează simularea pentru 20 secunde (20000 ms = 20000000 ns)
        button <=0;
        #200000
        button <= 1;
        #5 
        button <=0;
        #25000000
        $stop; // Oprește simularea
	end

endmodule 
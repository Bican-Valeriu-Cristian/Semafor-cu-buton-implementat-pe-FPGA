module clk_gen(
    output reg clk,
    output reg rst
);

initial begin
    clk = 0;
    rst = 0;
    #1 rst = 0;
    #10 rst = 1;
end

always #5 clk=!clk;

endmodule

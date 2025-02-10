module counter(
    input clk,
    input rst,
    input button,
    output reg [32:0] numar,
    output reg impuls,
    output reg [32:0] nrsecunde,
    output reg red,
    output reg green,
    output reg yellow,
    output reg t,
    output reg startsemafor,
    output reg secunda,
    output reg detect,
    output reg redpieton,
    output reg greenpieton,
    output reg stins1,
    output reg stins2
);

parameter nrstop = 12000;
parameter T_RED = 10; 
parameter T_GREEN = 5;   
parameter T_YELLOW = 2;
parameter T_DELAY = 10; 

always @(posedge clk or negedge rst) begin      // impuls da 1 secunda
     if (~rst) begin
        numar  <= 0;
        impuls <= 0;
     end else if (numar<nrstop) begin
        numar <= numar+1;
        impuls <= 0;
     end else begin 
        numar <= 0;
        impuls <= 1;
     end
end

always  @(posedge clk or negedge rst) begin
    if (~rst) begin
        nrsecunde <= 0;
        secunda <= 1;
    end else if (nrsecunde == T_RED+T_GREEN+T_YELLOW+T_DELAY) begin
        nrsecunde <= 0;
    end else if(impuls == 1 && startsemafor == 1)begin
        nrsecunde <= nrsecunde +1;
        secunda <= ~secunda;
    end
end
always @(posedge clk or negedge rst) begin
    if (~rst) begin
        t <= 1;
        startsemafor <= 0;
        detect <= 0;
    end else begin
        if (button == 1 && t == 0) begin
            detect <= 1; 
            startsemafor <= 1; 
        end else if (button == 0 && t == 1) begin
            detect <= 0;
        end

        if (nrsecunde >= T_RED + T_GREEN + T_YELLOW + T_DELAY) begin
            startsemafor <= 0;
        end
        t<=button;
    end
end

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        red <= 1;
        yellow <= 1;      
        green <= 0;
        redpieton <= 0;
        greenpieton <= 1;
        stins1 <=1;
        stins2 <=1;

    end else if(startsemafor) begin
        if (nrsecunde == T_GREEN) begin   // trece din verde in galben
            red <= 1;
            yellow <= 0;      
            green <= 1;
            redpieton <= 0;
            greenpieton <= 1;
        end else if (nrsecunde == T_GREEN + T_YELLOW) begin // trece din galben in rosu
            red <= 0;
            yellow <= 1;
            green <= 1;  
            redpieton <= 1;
            greenpieton <= 0;
        end else if (nrsecunde == T_GREEN+T_YELLOW+T_RED) begin // trece din rosu in verde
            red <= 1;
            yellow <= 1;      
            green <= 0;
            redpieton <= 0;
            greenpieton <= 1;
        end
    end
end

endmodule

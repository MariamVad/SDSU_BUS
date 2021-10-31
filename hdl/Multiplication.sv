module Multiplication(
    input logic clk,
    input logic begin_calc, 
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[31:0] c,
    output logic calculated
);

logic[15:0] M = 0;
logic[15:0] Q = 0;
logic[16:0] acc = 0;
logic[5:0] count = 0;
logic[32:0] temp = 0;



    always @(posedge clk) begin
        calculated <= 0;
        if(begin_calc == 1) begin
            if(count == 0) begin
                M <= a;
                Q <= b;
                acc <= 0;
            end
            if(count < 17) begin
                if(Q[0] == 1) acc = acc + M;

                   temp = { acc, Q};
                   {acc, Q} = temp >> 1;
                   count = count + 1;

            end 
            
            else begin
                calculated <= 1;
                c <= {acc, Q};  
                count <= 0;
            end    
	
        end
    
    end

endmodule

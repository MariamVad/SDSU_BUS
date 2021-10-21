module Register_File(
    input logic clk,
    input logic[31:0] address,
    input logic[31:0] data,
    input logic write,
    input logic exec,
    output logic[31:0] result_data
);


logic[31:0] RegisterFile[31:0];

always @(posedge clk) begin
    if(exec == 1) begin 
        if(write == 1)
            RegisterFile[address] <= data;
        else        
            result_data <= RegisterFile[address];
    end
end


endmodule
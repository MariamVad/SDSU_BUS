module Register_File(
    input logic clk,
    input logic[31:0] address,
    input logic[31:0] data_write,
    input logic write,
    input logic exec,
    output logic[31:0] data_read 
);


logic[31:0] RegisterFile[31:0];

always @(posedge clk) begin
    if(exec == 1) begin 
        if(write == 1)
            RegisterFile[address] <= data_write;
        else        
            data_read <= RegisterFile[address];
    end
end


endmodule
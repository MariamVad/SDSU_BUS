module Slave(
    input logic clk,
    input logic valid,
    input logic start,
    input logic[31:0] address,
    output logic ready,
    output logic[31:0]  result_data

   // input logic[31:0] address2,
    //input logic[31:0] data,
    //input logic[31:0] input2
);

//logic slave_address1;
//logic slave_address2;
logic[31:0] slave_data1;
logic[31:0] slave_data2;
logic[31:0] data;
logic exec = 0;
logic[31:0] register_data;
logic write = 0;

//logic[1:0] i = 2'b00;

always @(posedge clk) begin
    if(valid == 1) begin
        ready <= 0;
        exec = 1;
        case (address) 
            0: begin
                if(start == 1) begin
                    ready <= 1;
                    write <= 1;
                    result_data <= slave_data1 * slave_data2;
                end
                
            end
            1: begin
                write <= 0;
                slave_data1 <= register_data;
                end
            2: begin
              write <= 0;
              slave_data2 <= register_data;
            end
        endcase
    end
    else exec = 0;

end

Register_File register_file(.clk(clk), .address(address), .data(register_data), .result_data(result_data), .write(write), .exec(exec));

endmodule
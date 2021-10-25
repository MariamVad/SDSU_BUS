module Slave(
    input logic clk,
    input logic valid,
    input logic start,
    input logic[31:0] address,
    input logic[31:0] register_data,
    output logic exec = 0,
    output logic write = 1,
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
logic[31:0] incoming_address;
logic calculated = 0;

Multiplication mult(.clk(clk), .a(slave_data1), .b(slave_data2), .start(start), .c(result_data), .calculated(calculated));

initial begin
exec <= 0;
write <= 0;
end
//logic[1:0] i = 2'b00;

always @(posedge clk) begin
ready <= 0;
    if(valid == 1) begin
        exec <= 1;
        case (incoming_address)
            0: begin    
                if(start == 1 && calculated == 1) begin
                    ready <= 1;
                    write <= 1;
                   // result_data <= slave_data1 * slave_data2;
                    //exec <= 1;
                end

            end

            1: begin
                write <= 0;
                slave_data1 <= register_data;
                //exec <= 1;
            end
            2: begin
                write <= 0;
                slave_data2 <= register_data;
                //exec <= 1;
            end

        endcase
    end
    else exec <= 0;
    incoming_address = address;

end

//Register_File register_file(.clk(clk), .address(address), .data(register_data), .result_data(result_data), .write(write), .exec(exec));

endmodule
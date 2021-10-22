module Top(
    input logic clk,
    output logic[31:0] result_data
);

logic ready = 0;
logic valid = 0;
logic start = 0;
logic[31:0] address = 0;
logic[31:0] data = 0;
logic[31:0] data_mult = 0;
logic[31:0] data_init = 0;
logic[31:0] register_data = 0;
logic write = 0;
logic exec = 0;
logic write_m = 0;
logic exec_m = 0;
logic write_s = 0;
logic exec_s = 0;
//logic[31:0] RegisterFile[31:0]



Master master(.clk(clk), .ready(ready), .result_data(result_data), .valid(valid), .start(start), .address(address), 
    .data(data_init),  .exec(exec_m), .write(write_m) /*, .RegisterFile(RegisterFile)*/);

Register_File register_file(.clk(clk), .address(address), .data_write(data),  .data_read(register_data), .write(write), .exec(exec) 
//.RegisterFile(RegisterFile)
);

Slave slave(.clk(clk), .valid(valid), .start(start), .address(address), .ready(ready), .exec(exec_s), .write(write_s), .register_data(register_data),
    .result_data(data_mult) /*, .RegisterFile(RegisterFile)*/);


always @(*) begin
/*
    register_file.address <= address;
    register_file.data <= data;
    register_file.exec <= exec;
    register_file.write <= write;
    result_data <= register_file.result_data;
    */
   // slave.address <= address;

    if(slave.ready == 1) begin
        address <= 16'h10;
        data <= data_mult;
    end

    result_data <= slave.result_data;
    if(master.exec == 1) begin
        data <= data_init;
        exec <= exec_m;
        write <= write_m;
    end
    else begin
        data <= data_mult;
        exec <= exec_s;
        write <= write_s;
    end

end


endmodule
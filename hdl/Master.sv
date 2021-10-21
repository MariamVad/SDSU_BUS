module Master(
    input logic clk,
    input logic ready,
    input logic[31:0] result_data,
    output logic valid,
    output logic start,
    output logic[31:0] address,
    //output logic[31:0] address2,
    output logic[31:0] data
    //output logic[31:0] input2
);

//logic fixed_seed = 31'b1111_1111_1111_1111_1111_1111_1111_1111;
logic[1:0] i = 2'b00;
logic exec = 0;
logic write = 1;


always @(posedge clk) begin
    exec = 0;
    start = 0;

    if(i == 2) begin
        valid <= 0;
    end

    if(i < 2) begin
        exec = 1;
       // if(i < 2) begin
        valid = 1;
        //address <= $random (fixed_seed);
    // address2 <= $random (fixed_seed);
        data = $random (4294967296);
        //input2 <= $random (fixed_seed);
        //start <= 1;
        address = i + 1;
        exec = 1;

        i = i + 1;
    end
    else begin
        start <= 1;
        exec <= 1;
        address <= 0;
        valid <= 0;
        address <= 0;
        data <= start;
        i = i + 1;
    end


    if(ready == 1 && i == 3) begin
        valid <= 0;
        i <= 0;
        exec <= 0;
    end

end

/*
always @(*) begin
    register_file.address <= address;
    register_file.start <= start;
    register_file.exec <= exec;
end
*/
Register_File register_file(.clk(clk), .address(address), .data(data),  .result_data(result_data), .write(write), .exec(exec));

endmodule
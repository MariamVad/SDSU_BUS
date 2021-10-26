module Master(
    input logic clk,
    input logic ready,
    input logic[31:0] result_data,
   // input logic[31:1]
    output logic valid,
    output logic start,
    output logic[31:0] address,
    output logic exec = 0,
    output logic write = 1,
    //output logic[31:0] address2,
    output logic[31:0] data
    //output logic[31:0] input2
);

//logic fixed_seed = 31'b1111_1111_1111_1111_1111_1111_1111_1111;
logic[6:0] i = 7'b0000000;

initial begin
exec <= 0;
write <= 1;
start = 0;
end

always @(posedge clk) begin

    if(ready == 1) i <= 0;
    if(i == 0 || i == 2 || i == 4)  begin 
        
        exec <= 1;
        valid <= 1;
        //data <= $random (64'd4294967296);
        data <= $random % (32768 + i);
        //data <= i + 10;

        if(i == 0) address <= 1;
        else if (i == 2) begin address <= 2; start <= 0; end
        else begin
            address <= 0;
            start <= 1;
            data <= start;
        end
    end

    else if(i == 1 || i == 3 || i == 5) begin
        exec <= 0;
        valid <= 0;
    end

    i = i + 1;

end

/*
always @(*) begin
    register_file.address <= address;
    register_file.start <= start;
    register_file.exec <= exec;
end
*/


endmodule
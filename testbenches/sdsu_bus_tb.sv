module sdsu_bus_tb();

logic clk = 0;
logic ready = 0;
logic[31:0] result_data = 0;
logic valid = 0;
logic start = 0;
logic[31:0] address = 0;
logic[31:0] data = 0;


always #10 clk <= ~clk;

Master master(.clk(clk), .ready(ready), .result_data(result_data), .valid(valid), .start(start), .address(address), .data(data));

Slave slave(.clk(clk), .valid(valid), .start(start), .address(address), .ready(ready), .result_data(result_data));

endmodule
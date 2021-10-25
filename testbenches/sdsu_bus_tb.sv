module sdsu_bus_tb();

logic clk = 0;
logic[31:0] result_data;


always #100 clk <= ~clk;

Top top(clk, result_data);

endmodule
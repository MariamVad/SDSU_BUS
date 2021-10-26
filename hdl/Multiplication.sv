// module Multiplication(
//     input logic clk,
//     input logic start, 
//     input logic[15:0] a,
//     input logic[15:0] b,
//     output logic[31:0] c,
//     output logic calculated
// );

// reg [15:0] State;
// reg [32:0] ACC;

// initial
// begin
//     State = 0;
//     ACC = 0;
// end

// always @(posedge clk)
// begin
// State = 0;
// while(State != 33) begin
//     if(State == 0)
//             begin
//                 if(start == 1'b1)
//                 begin
//                     ACC[32:16] <= 5'b00000 ;
//                     ACC[15:0] <= b ;
//                     State <= 1;
//                 end
//             end
//              if(State == 1 || State == 3 || State == 5 || State == 7 ||State == 9 ||State == 11 ||State == 12 ||State == 13 ||State == 15 ||State == 17 ||
//              State == 19 || State == 21 || State == 23 || State == 25 || State == 27 || State == 29 || State == 31)
//             begin
//                // if(`M==1'b1)
//                 //begin
//                     ACC[31:16] <= {1'b0, ACC[30:4]} + a;
//                     State <= State +1;
//                 //end
//                 //else
//                 //begin
//                   //  ACC <= {1'b0, ACC[31:1]};
//                     //State <= State + 2;
//                 //end
//             end
//             if(State == 2 || State == 4 || State == 6 || State == 8 ||State == 10 ||State == 12 ||State == 14 ||State == 16 ||State == 18 ||State == 20 ||
//              State == 22 || State == 24 || State == 26 || State == 28 || State == 30 || State == 32 )
//             begin
//                 ACC <= {1'b0, ACC[31:1]};
//                 State <= State +1;
//             end
//         if(State == 33)
//             begin
//                 State <= 0;
//             end
        
//     end
//     end

//     assign calculated = (State == 33) ? 1'b1 : 1'b0 ;
//     assign c = (State == 33) ? ACC[15:0] : 0;
// endmodule

// module Multiplication(
//     input logic clk,
//     input logic start, 
//     input logic[15:0] a,
//     input logic[15:0] b,
//     output logic[31:0] c,
//     output logic calculated
// );

// logic[31:0] temp = 0;
// logic[15:0] multiplier;

//     always @(posedge clk) begin
        
//         if(start == 1) begin
//             c <= a * b;
//             calculated <= 1;
//         end
    
//     end

// endmodule




module Multiplication(
    input logic clk,
    input logic start, 
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[31:0] c,
    output logic calculated
);

// logic[31:0] M = 32'b0000_0000_0000_0000_0000_0000_0000_0000 + a;
// logic[31:0] Q = 32'b0000_0000_0000_0000_0000_0000_0000_0000 + b;
// logic[31:0] acc = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

logic[15:0] M = 0;
logic[15:0] Q = 0;
logic[16:0] acc = 0;
logic[5:0] count = 0;
logic[32:0] temp = 0;

// initial begin
//     M  = 0;
//     Q  = 0;
// end


    always @(posedge clk) begin
        
        if(start == 1) begin
            if(count == 0) begin
                // M = 32'b0000_0000_0000_0000_0000_0000_0000_0000 + a;
                // Q = 32'b0000_0000_0000_0000_0000_0000_0000_0000 + b;
                // acc = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
                M = a;
               
                acc = 0;
                // Q = b;
            end
            if(count < 4) begin
               
                if(count == 0) Q <= b;

                if(Q[0] == 1) acc = acc + M;
               //if(Q[0]) begin
                    
                   // acc <= acc + M;
                   temp = {1'b0, acc, Q};
                   {acc, Q} = temp >> 1;
                {acc, Q} = {1'b0, acc, Q};
                 count = count + 1;
                //end
                //else begin
                  //  count <= count + 1;
                    //{acc, Q} <= {1'b0, acc, Q};
                //end
            end 
            
            else begin
                calculated <= 1;
                c <= {acc, Q};  
                count <= 0;
            end    
	
        end
    
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:15 06/11/2019 
// Design Name: 
// Module Name:    traffic_light_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light_control(red0 , yellow0, green0, clk, reset, red1 , yellow1, green1, red2 , yellow2, green2);

input clk; 
input reset ;
output reg red0 ;
output reg red1 ;
output reg red2 ;
output reg yellow0 ;
output reg yellow1 ;
output reg yellow2 ;
output reg green0 ;
output reg green1 ;
output reg green2 ;


reg [3:0] current_state ;
reg [3:0] next_state ;


always@(posedge clk or posedge reset)
begin
	if(reset == 1'b1)
	begin
		current_state <= 3'b000 ;
	end
	else
	begin
		current_state <= next_state ;
	end
end


always@(current_state)
begin

	case(current_state)
	
	3'b000:begin     	// This is the case of turning the first path green light ON ..
			#10;
			next_state <= 3'b001 ;
			end
	
	3'b001:begin      // This is case of turning the first path yellow light ON ...
			#4 ;
			next_state <= 3'b010 ;
			end
	
	3'b010:begin                          // This is the case of turning the second path green light ON ..
			#10 ;
			next_state <= 3'b011 ;
			end
	
	3'b011:begin
			#4 ;
			next_state <= 3'b100 ;
			end

	3'b100:begin
			#10 ;
			next_state <= 3'b101 ;
			end

	3'b101:begin                      // This is the case of turning on the yellow light of second path and then again instructing it back to follow the same procedure of turning on the green light on first path again..
			#4 ;
			next_state <= 3'b000 ;
			end

	endcase

end



always @(current_state)
begin

	case(current_state)
	
	3'b000:begin
			
			red0  = 1'b0;
			red1 = 1'b1 ; 
			red2 = 1'b1 ;
			yellow0 = 1'b0 ;
			yellow1 = 1'b0 ;
			yellow2 = 1'b0 ;
			green0 = 1'b1 ;     // The green light will be on of first path .. and for rest two paths the red lights are ON ..
			green1 = 1'b0 ;
			green2 = 1'b0 ;

			end
	
	3'b001:begin
			
			red0  = 1'b0;
			red1 = 1'b1 ; 
			red2 = 1'b1 ;
			yellow0 = 1'b1 ;  // The yellow light of the first path is on and rest of two paths the red light is ON... 
			yellow1 = 1'b0 ;
			yellow2 = 1'b0 ;
			green0 = 1'b0 ;
			green1 = 1'b0 ;
			green2 = 1'b0 ;

			end
		

	3'b010:begin
			
			red0  = 1'b1;
			red1 = 1'b0 ; 
			red2 = 1'b1 ;
			yellow0 = 1'b0 ;
			yellow1 = 1'b0 ;
			yellow2 = 1'b0 ;
			green0 = 1'b0 ;
			green1 = 1'b1 ;   // the green light of second path is ON and for rest of the two paths the red light will be ON..
 			green2 = 1'b0 ;

			end
	
	3'b011:begin
			
			red0  = 1'b1;
			red1 = 1'b0 ; 
			red2 = 1'b1 ;
			yellow0 = 1'b0 ;
			yellow1 = 1'b1 ;   // the yellow light of second path is ON and other two paths red light is ON...
			yellow2 = 1'b0 ;
			green0 = 1'b0 ;
			green1 = 1'b0 ;
			green2 = 1'b0 ;

			end
	
	
	
	3'b100:begin
			
			red0  = 1'b1;
			red1 = 1'b1 ; 
			red2 = 1'b0 ;
			yellow0 = 1'b0 ;
			yellow1 = 1'b0 ;
			yellow2 = 1'b0 ;
			green0 = 1'b0 ;
			green1 = 1'b0 ;
			green2 = 1'b1 ;

			end
	
	
	

	3'b101:begin
			
			red0  = 1'b1;
			red1 = 1'b1 ; 
			red2 = 1'b0 ;
			yellow0 = 1'b0 ;
			yellow1 = 1'b0 ;
			yellow2 = 1'b1 ;
			green0 = 1'b0 ;
			green1 = 1'b0 ;
			green2 = 1'b0 ;

			end
	
	endcase

end


















 






endmodule

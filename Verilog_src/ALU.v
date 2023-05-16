module ALU(
	input [15:0]A,
	input [15:0]B,
	input [2:0]opcode,
	output reg [15:0]result,
	output reg ZERO
	);
	integer i;

always @(*)
begin
	case(opcode)
	3'b000 : result = A + B;
	3'b001 : result = A - B;
	3'b010 : result = A * B;
	3'b011 : result = A / B;
	3'b100 : result = A | B;
	3'b101 : result = ~(A | B);
	3'b110 : result = ~(A & B);
	endcase	
	// assign ZERO
	for(i=0; i<16; i=i+1)
	begin
	ZERO = ZERO | result[i];
	end
	ZERO = ~ZERO;
end

endmodule
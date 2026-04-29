`default_nettype none

module glyphs_rom(
    input  wire [2:0] c, // Reduced to 3 bits (0-7) for the 8 characters
    input  wire [3:0] y, 
    input  wire [2:0] x, 
    output reg pixel
);
    reg [7:0] rb; 

    always @(*) begin
        case (c) 
            0: case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9,10:rb=8'hC0; default:rb=0; endcase // P
            1: case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            2: case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // G
            3: case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            4: rb = 8'h00; // SPACE
            5: case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            6: case(y) 2,10:rb=8'hC6; 3,9:rb=8'hCC; 4,8:rb=8'hD8; 5,7:rb=8'hF0; 6:rb=8'hE0; default:rb=0; endcase // K
            7: case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            default: rb = 8'h00; 
        endcase
        pixel = rb[7-x];
    end
endmodule
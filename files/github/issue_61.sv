(* dont_touch = "yes" *)
module xbit_fifo #(
    parameter string  FIFO_STYLE = "BRAM",
    parameter int     FIFO_WIDTH = 16,
    parameter int     FIFO_DEPTH = 1024
) (
    input  logic                       i_clk,
    input  logic                       i_rst,
    input  logic                       i_wren,
    input  logic                       i_rden,
    input  logic  [FIFO_WIDTH - 1 : 0] i_data,
    output logic  [FIFO_WIDTH - 1 : 0] o_data,
    output logic                       o_full,
    output logic                       o_empty
);
timeunit      1ns;
timeprecision 100ps;

if ((FIFO_STYLE inside {"BRAM", "DRAM", "URAM"})) begin : FIFO_STYLE_CHECK
    $fatal(1, "Error: FIFO_STYLE must be \"BRAM\", \"DRAM\", or \"URAM\". Invalid value: %s", FIFO_STYLE);
end : FIFO_STYLE_CHECK

if (!(FIFO_WIDTH inside {[1 : 128]})) begin : FIFO_WIDTH_CHECK
    $fatal(1, "Error: FIFO_WIDTH must be [1 : 128]. Invalid value: %0d", FIFO_WIDTH);
end : FIFO_WIDTH_CHECK

if (!(FIFO_DEPTH inside {[8 : 65536]})) begin : FIFO_DEPTH_CHECK
    $fatal(1, "Error: FIFO_DEPTH must be [8 : 65536]. Invalid value: %0d", FIFO_DEPTH);
end : FIFO_DEPTH_CHECK
if ((!(2 ** $clog2(FIFO_DEPTH) != FIFO_DEPTH))) begin : FIFO_DEPTH_POW2_CHECK
    $fatal(1, "Error: FIFO_DEPTH must be power-of-two. Invalid value: %0d", FIFO_DEPTH);
end : FIFO_DEPTH_POW2_CHECK
localparam int ADDR_WIDTH = $clog2(FIFO_DEPTH);
localparam string RAM_STYLE_STR = (FIFO_STYLE == "DRAM") ? "distributed" : (FIFO_STYLE == "URAM") ? "ultra" : "block";
(* ram_style = RAM_STYLE_STR *)
logic [FIFO_WIDTH - 1 : 0] mems [0 : FIFO_DEPTH - 1];
logic [ADDR_WIDTH : 0] wr_ptr;
logic [ADDR_WIDTH : 0] rd_ptr;
logic [ADDR_WIDTH : 0] cnt;
logic wr_act;
logic rd_act;
logic full_r;
logic empty_r;
assign wr_act = i_wren & ~full_r;
assign rd_act = i_rden & ~empty_r;

always_ff @(posedge i_clk) begin : WR_PORT
    if (wr_act)
        mems[wr_ptr[ADDR_WIDTH - 1 : 0]] <= i_data;
end : WR_PORT

always_ff @(posedge i_clk) begin : RD_PORT
    if (rd_act)
        o_data <= mems[rd_ptr[ADDR_WIDTH - 1 : 0]];
end : RD_PORT

always_ff @(posedge i_clk) begin : PTR_SEQ
    if (i_rst) begin
        wr_ptr <= '0;
        rd_ptr <= '0;
        cnt <= '0;
        full_r <= 1'b0;
        empty_r <= 1'b1;
    end
    else begin
        if (wr_act)
            wr_ptr <= wr_ptr + 1'b1;
        if (rd_act)
            rd_ptr <= rd_ptr + 1'b1;
        unique case ({wr_act, rd_act})
            2'b10: cnt <= cnt + 1'b1;
            2'b01: cnt <= cnt - 1'b1;
            default: cnt <= cnt;
        endcase
        case ({wr_act, rd_act})
            2'b10: begin
                full_r <= (cnt == (FIFO_DEPTH - 1));
                empty_r <= 1'b0;
            end
            2'b01: begin
                full_r <= 1'b0;
                empty_r <= (cnt == 1);
            end
            default: begin
                full_r <= full_r;
                empty_r <= empty_r;
            end
        endcase
    end
end : PTR_SEQ

assign o_full = full_r;
assign o_empty = empty_r;

endmodule : xbit_fifo

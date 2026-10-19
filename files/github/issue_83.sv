initial begin
    if (!(ar_id_cnt_full && slv_aw_chan.atop[axi_pkg::ATOP_R_RESP]) || !AtopSupport) begin  // ERROR
    end
    if (!(slv_aw_chan.atop[axi_pkg::ATOP_R_RESP] || !AtopSupport)) begin // OK
    end
    if (!(ar_id_cnt_full && slv_aw_chan.atop[ATOP_R_RESP]) || !AtopSupport) begin // OK
    end
end

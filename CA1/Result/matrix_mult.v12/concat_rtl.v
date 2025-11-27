
//------> ./rtl_mgc_ioport.v 
//------------------------------------------------------------------
//                M G C _ I O P O R T _ C O M P S
//------------------------------------------------------------------

//------------------------------------------------------------------
//                       M O D U L E S
//------------------------------------------------------------------

//------------------------------------------------------------------
//-- INPUT ENTITIES
//------------------------------------------------------------------

module mgc_in_wire (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;

  wire               vd;
  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;

endmodule
//------------------------------------------------------------------

module mgc_chan_in (ld, vd, d, lz, vz, z, size, req_size, sizez, sizelz);

  parameter integer rscid = 1;
  parameter integer width = 8;
  parameter integer sz_width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;
  output [sz_width-1:0] size;
  input              req_size;
  input  [sz_width-1:0] sizez;
  output             sizelz;


  wire               vd;
  wire   [width-1:0] d;
  wire               lz;
  wire   [sz_width-1:0] size;
  wire               sizelz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;
  assign size = sizez;
  assign sizelz = req_size;

endmodule


//------------------------------------------------------------------
//-- OUTPUT ENTITIES
//------------------------------------------------------------------

module mgc_out_stdreg (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  input  [width-1:0] d;
  output             lz;
  input              vz;
  output [width-1:0] z;

  wire               vd;
  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;
  assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_out_prereg_en (ld, d, lz, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    wire               lz;
    wire   [width-1:0] z;

    assign z = d;
    assign lz = ld;

endmodule

//------------------------------------------------------------------
//-- INOUT ENTITIES
//------------------------------------------------------------------

module mgc_inout_stdreg_en (ldin, din, ldout, dout, lzin, lzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    output             lzin;
    output             lzout;
    inout  [width-1:0] z;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign z = ldout ? dout : {width{1'bz}};

endmodule

//------------------------------------------------------------------
module hid_tribuf( I_SIG, ENABLE, O_SIG);
  parameter integer width = 8;

  input [width-1:0] I_SIG;
  input ENABLE;
  inout [width-1:0] O_SIG;

  assign O_SIG = (ENABLE) ? I_SIG : { width{1'bz}};

endmodule
//------------------------------------------------------------------

module mgc_inout_stdreg_wait (ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;
    wire   ldout_and_vzout;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign vdout = vzout ;
    assign ldout_and_vzout = ldout && vzout ;

    hid_tribuf #(width) tb( .I_SIG(dout),
                            .ENABLE(ldout_and_vzout),
                            .O_SIG(z) );

endmodule

//------------------------------------------------------------------

module mgc_inout_buf_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    hid_tribuf #(width) tb( .I_SIG(z_buf),
                            .ENABLE((lzout_buf && (!ldin) && vzout) ),
                            .O_SIG(z)  );

    mgc_out_buf_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFF
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );


endmodule

module mgc_inout_fifo_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer ph_log2 = 3;     // log2(fifo_sz)
    parameter integer pwropt  = 0;     // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               comb;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    assign comb = (lzout_buf && (!ldin) && vzout);

    hid_tribuf #(width) tb2( .I_SIG(z_buf), .ENABLE(comb), .O_SIG(z)  );

    mgc_out_fifo_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
    )
    FIFO
    (
        .clk   (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );

endmodule

//------------------------------------------------------------------
//-- I/O SYNCHRONIZATION ENTITIES
//------------------------------------------------------------------

module mgc_io_sync (ld, lz);

    input  ld;
    output lz;

    assign lz = ld;

endmodule

module mgc_bsync_rdy (rd, rz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 0;

    input  rd;
    output rz;

    wire   rz;

    assign rz = rd;

endmodule

module mgc_bsync_vld (vd, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 0;
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule

module mgc_bsync_rv (rd, vd, rz, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 1;

    input  rd;
    output vd;
    output rz;
    input  vz;

    wire   vd;
    wire   rz;

    assign rz = rd;
    assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_sync (ldin, vdin, ldout, vdout);

  input  ldin;
  output vdin;
  input  ldout;
  output vdout;

  wire   vdin;
  wire   vdout;

  assign vdin = ldout;
  assign vdout = ldin;

endmodule

///////////////////////////////////////////////////////////////////////////////
// dummy function used to preserve funccalls for modulario
// it looks like a memory read to the caller
///////////////////////////////////////////////////////////////////////////////
module funccall_inout (d, ad, bd, z, az, bz);

  parameter integer ram_id = 1;
  parameter integer width = 8;
  parameter integer addr_width = 8;

  output [width-1:0]       d;
  input  [addr_width-1:0]  ad;
  input                    bd;
  input  [width-1:0]       z;
  output [addr_width-1:0]  az;
  output                   bz;

  wire   [width-1:0]       d;
  wire   [addr_width-1:0]  az;
  wire                     bz;

  assign d  = z;
  assign az = ad;
  assign bz = bd;

endmodule


///////////////////////////////////////////////////////////////////////////////
// inlinable modular io not otherwise found in mgc_ioport
///////////////////////////////////////////////////////////////////////////////

module modulario_en_in (vd, d, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output             vd;
  output [width-1:0] d;
  input              vz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               vd;

  assign d = z;
  assign vd = vz;

endmodule

//------> ./rtl_mgc_ioport_v2001.v 
//------------------------------------------------------------------

module mgc_out_reg_pos (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(posedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(posedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg_neg (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(negedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(negedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg (clk, en, arst, srst, ld, d, lz, z); // Not Supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;


    generate
    if (ph_clk == 1'b0)
    begin: NEG_EDGE

        mgc_out_reg_neg
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_neg_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    else
    begin: POS_EDGE

        mgc_out_reg_pos
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_pos_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    endgenerate

endmodule




//------------------------------------------------------------------

module mgc_out_buf_wait (clk, en, arst, srst, ld, vd, d, vz, lz, z); // Not supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    output             vd;
    input  [width-1:0] d;
    output             lz;
    input              vz;
    output [width-1:0] z;

    wire               filled;
    wire               filled_next;
    wire   [width-1:0] abuf;
    wire               lbuf;


    assign filled_next = (filled & (~vz)) | (filled & ld) | (ld & (~vz));

    assign lbuf = ld & ~(filled ^ vz);

    assign vd = vz | ~filled;

    assign lz = ld | filled;

    assign z = (filled) ? abuf : d;

    wire dummy;
    wire dummy_bufreg_lz;

    // Output registers:
    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (1'b1),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    STATREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (filled_next),
        .d       (1'b0),       // input d is unused
        .lz      (filled),
        .z       (dummy)            // output z is unused
    );

    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (lbuf),
        .d       (d),
        .lz      (dummy_bufreg_lz),
        .z       (abuf)
    );

endmodule

//------------------------------------------------------------------

module mgc_out_fifo_wait (clk, en, arst, srst, ld, vd, d, lz, vz,  z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1; // clock enable polarity
    parameter         ph_arst = 1'b1; // async reset polarity
    parameter         ph_srst = 1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt


    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;

    wire    [31:0]      size;


      // Output registers:
 mgc_out_fifo_wait_core#(
        .rscid   (rscid),
        .width   (width),
        .sz_width (32),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
        ) CORE (
        .clk (clk),
        .en (en),
        .arst (arst),
        .srst (srst),
        .ld (ld),
        .vd (vd),
        .d (d),
        .lz (lz),
        .vz (vz),
        .z (z),
        .size (size)
        );

endmodule



module mgc_out_fifo_wait_core (clk, en, arst, srst, ld, vd, d, lz, vz,  z, size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // size of port for elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt

   localparam integer  fifo_b = width * fifo_sz;

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;
    output    [sz_width-1:0]      size;

    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat_pre;
    wire     [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] en_l;
    reg      [(((fifo_sz > 0) ? fifo_sz : 1)-1)/8:0] en_l_s;

    reg       [width-1:0] buff_nxt;

    reg                   stat_nxt;
    reg                   stat_before;
    reg                   stat_after;
    reg                   en_l_var;

    integer               i;
    genvar                eni;

    integer               count;
    integer               count_t;
    integer               n_elem;
// pragma translate_off
    integer               peak;
// pragma translate_on

    wire [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] dummy_statreg_lz;
    wire [( (fifo_b > 0) ? fifo_b : 1)-1:0] dummy_bufreg_lz;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign vd = vz | ~stat[0];
      assign lz = ld | stat[fifo_sz-1];
      assign size = (count - (vz && stat[fifo_sz-1])) + ld;
      assign z = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : d;

      always @(*)
      begin: FIFOPROC
        n_elem = 0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          if (i != 0)
            stat_before = stat[i-1];
          else
            stat_before = 1'b0;

          if (i != (fifo_sz-1))
            stat_after = stat[i+1];
          else
            stat_after = 1'b1;

          stat_nxt = stat_after &
                    (stat_before | (stat[i] & (~vz)) | (stat[i] & ld) | (ld & (~vz)));

          stat_pre[i] = stat_nxt;
          en_l_var = 1'b1;
          if (!stat_nxt)
            begin
              buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end
          else if (vz && stat_before)
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
          else if (ld && !((vz && stat_before) || ((!vz) && stat[i])))
            buff_nxt = d;
          else
            begin
              if (pwropt == 0)
                buff_nxt[0+:width] = buff[width*i+:width];
              else
                buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if ((stat_after == 1'b1) && (stat[i] == 1'b0))
            n_elem = (fifo_sz - 1) - i;
        end

        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b1;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b0;

        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if ((i%2) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]|stat_pre[i-1]);
            else
              en_l_s[(i/8)-1] = en | ~(stat[i]|stat_pre[i-1]);
          end
        end

        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 0;
        else if ( stat[0] == 1'b1 )
          count_t = fifo_sz;
        else
          count_t = n_elem;
        count = count_t;
// pragma translate_off
        if ( peak < count )
          peak = count;
// pragma translate_on
      end

      if (pwropt == 0)
      begin: NOCGFIFO
        // Output registers:
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        STATREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
        );
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_b),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        BUFREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre),
            .lz      (dummy_bufreg_lz[0]),
            .z       (buff)
        );
      end
      else
      begin: CGFIFO
        // Output registers:
        if ( pwropt > 1)
        begin: CGSTATFIFO2
          for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
          begin: pwroptGEN1
            mgc_out_reg
            #(
              .rscid   (rscid),
              .width   (1),
              .ph_clk  (ph_clk),
              .ph_en   (ph_en),
              .ph_arst (ph_arst),
              .ph_srst (ph_srst)
            )
            STATREG
            (
              .clk     (clk),
              .en      (en_l_s[eni/8]),
              .arst    (arst),
              .srst    (srst),
              .ld      (1'b1),
              .d       (stat_pre[eni]),
              .lz      (dummy_statreg_lz[eni]),
              .z       (stat[eni])
            );
          end
        end
        else
        begin: CGSTATFIFO
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          STATREG
          (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
          );
        end
        for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
        begin: pwroptGEN2
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (width),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          BUFREG
          (
            .clk     (clk),
            .en      (en_l[eni]),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre[width*eni+:width]),
            .lz      (dummy_bufreg_lz[width*eni+:width]),
            .z       (buff[width*eni+:width])
          );
        end
      end
    end
    else
    begin: FEED_THRU
      assign vd = vz;
      assign lz = ld;
      assign z = d;
      assign size = ld && !vz;
    end
    endgenerate

endmodule

//------------------------------------------------------------------
//-- PIPE ENTITIES
//------------------------------------------------------------------
/*
 *
 *             _______________________________________________
 * WRITER    |                                               |          READER
 *           |           MGC_PIPE                            |
 *           |           __________________________          |
 *        --<| vdout  --<| vd ---------------  vz<|-----ldin<|---
 *           |           |      FIFO              |          |
 *        ---|>ldout  ---|>ld ---------------- lz |> ---vdin |>--
 *        ---|>dout -----|>d  ---------------- dz |> ----din |>--
 *           |           |________________________|          |
 *           |_______________________________________________|
 */
// two clock pipe
module mgc_pipe (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, size, req_size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter integer log2_sz = 3; // log2(fifo_sz)
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer pwropt  = 0; // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output [sz_width-1:0]      size;
    input              req_size;


    mgc_out_fifo_wait_core
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz),
        .pwropt   (pwropt)
    )
    FIFO
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (vdin),
        .vz      (ldin),
        .z       (din),
        .size    (size)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   TA@TA-PC
//  Generated date: Fri Mar 29 21:25:06 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module matrix_mult_core_fsm (
  clk, rst, core_wen, fsm_output, st_loop3_1_tr0, st_loop2_1_tr0, st_loop1_tr0
);
  input clk;
  input rst;
  input core_wen;
  output [7:0] fsm_output;
  reg [7:0] fsm_output;
  input st_loop3_1_tr0;
  input st_loop2_1_tr0;
  input st_loop1_tr0;


  // FSM State Type Declaration for matrix_mult_core_fsm_1
  parameter
    st_main = 3'd0,
    st_main_1 = 3'd1,
    st_loop3 = 3'd2,
    st_loop3_1 = 3'd3,
    st_loop2 = 3'd4,
    st_loop2_1 = 3'd5,
    st_loop1 = 3'd6,
    st_main_2 = 3'd7,
    state_x = 3'b000;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;

  always @(st_loop3_1_tr0 or st_loop2_1_tr0 or st_loop1_tr0 or state_var)
  begin : matrix_mult_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 8'b1;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 8'b10;
        state_var_NS = st_loop3;
      end
      st_loop3 : begin
        fsm_output = 8'b100;
        state_var_NS = st_loop3_1;
      end
      st_loop3_1 : begin
        fsm_output = 8'b1000;
        if ( st_loop3_1_tr0 ) begin
          state_var_NS = st_loop2;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      st_loop2 : begin
        fsm_output = 8'b10000;
        state_var_NS = st_loop2_1;
      end
      st_loop2_1 : begin
        fsm_output = 8'b100000;
        if ( st_loop2_1_tr0 ) begin
          state_var_NS = st_loop1;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      st_loop1 : begin
        fsm_output = 8'b1000000;
        if ( st_loop1_tr0 ) begin
          state_var_NS = st_main_2;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      st_main_2 : begin
        fsm_output = 8'b10000000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 8'b00000000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= st_main;
    end
    else if ( core_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core_wait_ctrl
// ------------------------------------------------------------------


module matrix_mult_core_wait_ctrl (
  clk, rst, core_wen, mgc_start_sync_mgc_bsync_vld_vd, mgc_done_sync_mgc_bsync_rdy_rd_core_sct,
      input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct, input_matrix1_rsc_REGISTER_FILE_bcwt_1,
      input_matrix2_rsc_REGISTER_FILE_bcwt_1, mgc_start_sync_mgc_bsync_vld_oswt,
      mgc_done_sync_mgc_bsync_rdy_rd_core_psct, input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff,
      input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct_pff
);
  input clk;
  input rst;
  output core_wen;
  input mgc_start_sync_mgc_bsync_vld_vd;
  output mgc_done_sync_mgc_bsync_rdy_rd_core_sct;
  input input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct;
  output input_matrix1_rsc_REGISTER_FILE_bcwt_1;
  reg input_matrix1_rsc_REGISTER_FILE_bcwt_1;
  output input_matrix2_rsc_REGISTER_FILE_bcwt_1;
  reg input_matrix2_rsc_REGISTER_FILE_bcwt_1;
  input mgc_start_sync_mgc_bsync_vld_oswt;
  input mgc_done_sync_mgc_bsync_rdy_rd_core_psct;
  output input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff;
  input input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct_pff;


  // Interconnect Declarations
  wire input_matrix1_rsc_REGISTER_FILE_tiswt0_1;
  wire input_matrix1_rsc_REGISTER_FILE_biwt_1;
  reg input_matrix1_rsc_REGISTER_FILE_icwt_1;
  reg core_wten;
  wire input_matrix2_rsc_REGISTER_FILE_biwt_1;
  reg input_matrix2_rsc_REGISTER_FILE_icwt_1;
  wire mgc_start_sync_mgc_bsync_vld_pdswt0;
  wire mgc_start_sync_mgc_bsync_vld_biwt;
  reg mgc_start_sync_mgc_bsync_vld_icwt;
  reg mgc_start_sync_mgc_bsync_vld_bcwt;
  wire mgc_done_sync_mgc_bsync_rdy_ogwt;
  wire mgc_done_sync_mgc_bsync_rdy_pdswt0;
  reg mgc_done_sync_mgc_bsync_rdy_icwt;
  reg mgc_done_sync_mgc_bsync_rdy_bcwt;
  wire and_4_cse;

  assign input_matrix1_rsc_REGISTER_FILE_tiswt0_1 = (~ core_wten) & input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct;
  assign input_matrix1_rsc_REGISTER_FILE_biwt_1 = input_matrix1_rsc_REGISTER_FILE_tiswt0_1
      | input_matrix1_rsc_REGISTER_FILE_icwt_1;
  assign and_4_cse = input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct & core_wen;
  assign input_matrix2_rsc_REGISTER_FILE_biwt_1 = input_matrix1_rsc_REGISTER_FILE_tiswt0_1
      | input_matrix2_rsc_REGISTER_FILE_icwt_1;
  assign mgc_start_sync_mgc_bsync_vld_pdswt0 = (~ core_wten) & mgc_start_sync_mgc_bsync_vld_oswt;
  assign mgc_start_sync_mgc_bsync_vld_biwt = (mgc_start_sync_mgc_bsync_vld_pdswt0
      | mgc_start_sync_mgc_bsync_vld_icwt) & mgc_start_sync_mgc_bsync_vld_vd;
  assign mgc_done_sync_mgc_bsync_rdy_pdswt0 = (~ core_wten) & mgc_done_sync_mgc_bsync_rdy_rd_core_psct;
  assign mgc_done_sync_mgc_bsync_rdy_ogwt = mgc_done_sync_mgc_bsync_rdy_pdswt0 |
      mgc_done_sync_mgc_bsync_rdy_icwt;
  assign mgc_done_sync_mgc_bsync_rdy_rd_core_sct = mgc_done_sync_mgc_bsync_rdy_rd_core_psct
      & mgc_done_sync_mgc_bsync_rdy_ogwt;
  assign core_wen = ((~ input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct) | input_matrix1_rsc_REGISTER_FILE_biwt_1
      | input_matrix1_rsc_REGISTER_FILE_bcwt_1) & ((~ input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct)
      | input_matrix2_rsc_REGISTER_FILE_biwt_1 | input_matrix2_rsc_REGISTER_FILE_bcwt_1)
      & ((~ mgc_start_sync_mgc_bsync_vld_oswt) | mgc_start_sync_mgc_bsync_vld_biwt
      | mgc_start_sync_mgc_bsync_vld_bcwt) & ((~ mgc_done_sync_mgc_bsync_rdy_rd_core_psct)
      | mgc_done_sync_mgc_bsync_rdy_ogwt | mgc_done_sync_mgc_bsync_rdy_bcwt);
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff = input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct_pff
      & core_wen;
  always @(posedge clk) begin
    if ( rst ) begin
      input_matrix1_rsc_REGISTER_FILE_icwt_1 <= 1'b0;
      input_matrix1_rsc_REGISTER_FILE_bcwt_1 <= 1'b0;
      input_matrix2_rsc_REGISTER_FILE_icwt_1 <= 1'b0;
      input_matrix2_rsc_REGISTER_FILE_bcwt_1 <= 1'b0;
      mgc_start_sync_mgc_bsync_vld_icwt <= 1'b0;
      mgc_start_sync_mgc_bsync_vld_bcwt <= 1'b0;
      mgc_done_sync_mgc_bsync_rdy_icwt <= 1'b0;
      mgc_done_sync_mgc_bsync_rdy_bcwt <= 1'b0;
      core_wten <= 1'b0;
    end
    else begin
      input_matrix1_rsc_REGISTER_FILE_icwt_1 <= input_matrix1_rsc_REGISTER_FILE_icwt_1
          ^ input_matrix1_rsc_REGISTER_FILE_tiswt0_1 ^ input_matrix1_rsc_REGISTER_FILE_biwt_1;
      input_matrix1_rsc_REGISTER_FILE_bcwt_1 <= input_matrix1_rsc_REGISTER_FILE_bcwt_1
          ^ input_matrix1_rsc_REGISTER_FILE_biwt_1 ^ and_4_cse;
      input_matrix2_rsc_REGISTER_FILE_icwt_1 <= input_matrix2_rsc_REGISTER_FILE_icwt_1
          ^ input_matrix1_rsc_REGISTER_FILE_tiswt0_1 ^ input_matrix2_rsc_REGISTER_FILE_biwt_1;
      input_matrix2_rsc_REGISTER_FILE_bcwt_1 <= input_matrix2_rsc_REGISTER_FILE_bcwt_1
          ^ input_matrix2_rsc_REGISTER_FILE_biwt_1 ^ and_4_cse;
      mgc_start_sync_mgc_bsync_vld_icwt <= mgc_start_sync_mgc_bsync_vld_icwt ^ mgc_start_sync_mgc_bsync_vld_pdswt0
          ^ mgc_start_sync_mgc_bsync_vld_biwt;
      mgc_start_sync_mgc_bsync_vld_bcwt <= mgc_start_sync_mgc_bsync_vld_bcwt ^ mgc_start_sync_mgc_bsync_vld_biwt
          ^ (mgc_start_sync_mgc_bsync_vld_oswt & core_wen);
      mgc_done_sync_mgc_bsync_rdy_icwt <= mgc_done_sync_mgc_bsync_rdy_icwt ^ mgc_done_sync_mgc_bsync_rdy_pdswt0
          ^ mgc_done_sync_mgc_bsync_rdy_ogwt;
      mgc_done_sync_mgc_bsync_rdy_bcwt <= mgc_done_sync_mgc_bsync_rdy_bcwt ^ mgc_done_sync_mgc_bsync_rdy_ogwt
          ^ (mgc_done_sync_mgc_bsync_rdy_rd_core_psct & core_wen);
      core_wten <= ~ core_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core
// ------------------------------------------------------------------


module matrix_mult_core (
  clk, rst, input_matrix1_rsc_REGISTER_FILE_data_out, input_matrix2_rsc_REGISTER_FILE_data_out,
      input_matrix1_rsc_REGISTER_FILE_addr_rd_core, input_matrix2_rsc_REGISTER_FILE_addr_rd_core,
      output_rsc_mgc_out_stdreg_d, addr_rsc_mgc_out_stdreg_d, mgc_start_sync_mgc_bsync_vld_vd,
      mgc_done_sync_mgc_bsync_rdy_rd_core_sct, input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff
);
  input clk;
  input rst;
  input [15:0] input_matrix1_rsc_REGISTER_FILE_data_out;
  input [15:0] input_matrix2_rsc_REGISTER_FILE_data_out;
  output [6:0] input_matrix1_rsc_REGISTER_FILE_addr_rd_core;
  output [7:0] input_matrix2_rsc_REGISTER_FILE_addr_rd_core;
  output [35:0] output_rsc_mgc_out_stdreg_d;
  reg [35:0] output_rsc_mgc_out_stdreg_d;
  output [7:0] addr_rsc_mgc_out_stdreg_d;
  reg [7:0] addr_rsc_mgc_out_stdreg_d;
  input mgc_start_sync_mgc_bsync_vld_vd;
  output mgc_done_sync_mgc_bsync_rdy_rd_core_sct;
  output input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff;


  // Interconnect Declarations
  wire input_matrix1_rsc_REGISTER_FILE_bcwt_1;
  wire [15:0] input_matrix1_rsc_REGISTER_FILE_data_out_mxwt;
  reg [15:0] input_matrix1_rsc_REGISTER_FILE_data_out_bfwt;
  wire input_matrix2_rsc_REGISTER_FILE_bcwt_1;
  wire [15:0] input_matrix2_rsc_REGISTER_FILE_data_out_mxwt;
  reg [15:0] input_matrix2_rsc_REGISTER_FILE_data_out_bfwt;
  wire core_wen;
  wire [7:0] fsm_output;
  wire and_dcpl;
  wire or_dcpl_10;
  wire or_dcpl_11;
  reg [3:0] loop1_i_1_sva;
  reg [3:0] loop2_j_1_reg;
  reg [31:0] loop2_partial_out_sva;
  reg [3:0] loop3_k_1_reg;
  reg loop3_slc_itm;
  reg loop2_slc_itm;
  wire or_18_cse;
  reg reg_done_sync_mgc_bsync_rdy_iswt0_cse;
  reg reg_start_sync_mgc_bsync_vld_iswt0_cse;
  reg reg_input_matrix2_rsc_REGISTER_FILE_re_core_psct_cse;
  wire input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff;
  wire [4:0] z_out;
  wire [5:0] xz_out;
  wire [4:0] z_out_1;
  wire [5:0] xz_out_1;
  wire [4:0] z_out_2;
  wire [5:0] xz_out_2;
  wire [3:0] z_out_3;
  wire [4:0] xz_out_3;
  wire [5:0] z_out_4;
  wire [6:0] xz_out_4;
  wire [31:0] loop2_partial_out_sva_1;
  wire [32:0] xloop2_partial_out_sva_1;

  wire[2:0] mux_15_nl;
  wire[2:0] mux_8_nl;
  wire[3:0] mux_10_nl;
  wire[3:0] mux_11_nl;
  wire[3:0] mux1h_12_nl;
  wire[3:0] mux_13_nl;
  wire[4:0] mux_14_nl;
  matrix_mult_core_wait_ctrl matrix_mult_core_wait_ctrl_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .mgc_start_sync_mgc_bsync_vld_vd(mgc_start_sync_mgc_bsync_vld_vd),
      .mgc_done_sync_mgc_bsync_rdy_rd_core_sct(mgc_done_sync_mgc_bsync_rdy_rd_core_sct),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct(reg_input_matrix2_rsc_REGISTER_FILE_re_core_psct_cse),
      .input_matrix1_rsc_REGISTER_FILE_bcwt_1(input_matrix1_rsc_REGISTER_FILE_bcwt_1),
      .input_matrix2_rsc_REGISTER_FILE_bcwt_1(input_matrix2_rsc_REGISTER_FILE_bcwt_1),
      .mgc_start_sync_mgc_bsync_vld_oswt(reg_start_sync_mgc_bsync_vld_iswt0_cse),
      .mgc_done_sync_mgc_bsync_rdy_rd_core_psct(reg_done_sync_mgc_bsync_rdy_iswt0_cse),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff(input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd_core_psct_pff((fsm_output[2]))
    );
  matrix_mult_core_fsm matrix_mult_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .core_wen(core_wen),
      .fsm_output(fsm_output),
      .st_loop3_1_tr0((~ loop3_slc_itm)),
      .st_loop2_1_tr0((~ loop2_slc_itm)),
      .st_loop1_tr0((~ (z_out[3])))
    );
  assign input_matrix1_rsc_REGISTER_FILE_data_out_mxwt = MUX_v_16_2_2({input_matrix1_rsc_REGISTER_FILE_data_out
      , input_matrix1_rsc_REGISTER_FILE_data_out_bfwt}, input_matrix1_rsc_REGISTER_FILE_bcwt_1);
  assign input_matrix2_rsc_REGISTER_FILE_data_out_mxwt = MUX_v_16_2_2({input_matrix2_rsc_REGISTER_FILE_data_out
      , input_matrix2_rsc_REGISTER_FILE_data_out_bfwt}, input_matrix2_rsc_REGISTER_FILE_bcwt_1);
  assign xloop2_partial_out_sva_1 = loop2_partial_out_sva + conv_s2s_64_32(conv_u2u_16_32(input_matrix1_rsc_REGISTER_FILE_data_out_mxwt)
      * conv_u2u_16_32(input_matrix2_rsc_REGISTER_FILE_data_out_mxwt));
  assign loop2_partial_out_sva_1 = xloop2_partial_out_sva_1[31:0];
  assign and_dcpl = ~((fsm_output[6]) | (fsm_output[1]));
  assign or_dcpl_10 = (fsm_output[5]) | (fsm_output[3]);
  assign or_dcpl_11 = (fsm_output[6]) | (fsm_output[1]);
  assign or_18_cse = or_dcpl_11 | (fsm_output[5]);
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd_core = {(z_out + ({1'b1 , (~ loop1_i_1_sva)}))
      , (loop3_k_1_reg[1:0])};
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff = input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff;
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd_core = {z_out_4 , (z_out_2[1:0])};
  always @(posedge clk) begin
    if ( rst ) begin
      input_matrix1_rsc_REGISTER_FILE_data_out_bfwt <= 16'b0;
      input_matrix2_rsc_REGISTER_FILE_data_out_bfwt <= 16'b0;
    end
    else begin
      input_matrix1_rsc_REGISTER_FILE_data_out_bfwt <= input_matrix1_rsc_REGISTER_FILE_data_out_mxwt;
      input_matrix2_rsc_REGISTER_FILE_data_out_bfwt <= input_matrix2_rsc_REGISTER_FILE_data_out_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      loop1_i_1_sva <= 4'b0;
      addr_rsc_mgc_out_stdreg_d <= 8'b0;
      output_rsc_mgc_out_stdreg_d <= 36'b0;
      reg_done_sync_mgc_bsync_rdy_iswt0_cse <= 1'b0;
      reg_start_sync_mgc_bsync_vld_iswt0_cse <= 1'b0;
      reg_input_matrix2_rsc_REGISTER_FILE_re_core_psct_cse <= 1'b0;
      loop2_j_1_reg <= 4'b0;
      loop2_partial_out_sva <= 32'b0;
      loop3_k_1_reg <= 4'b0;
      loop3_slc_itm <= 1'b0;
      loop2_slc_itm <= 1'b0;
    end
    else if ( core_wen ) begin
      loop1_i_1_sva <= (MUX_v_4_2_2({z_out_3 , loop1_i_1_sva}, and_dcpl)) & (signext_4_1(~
          (fsm_output[1])));
      addr_rsc_mgc_out_stdreg_d <= MUX_v_8_2_2({addr_rsc_mgc_out_stdreg_d , ({z_out_4
          , (z_out_2[1:0])})}, fsm_output[4]);
      output_rsc_mgc_out_stdreg_d <= MUX_v_36_2_2({({{4{loop2_partial_out_sva_1[31]}},
          loop2_partial_out_sva_1}) , output_rsc_mgc_out_stdreg_d}, (~ (fsm_output[3]))
          | loop3_slc_itm);
      reg_done_sync_mgc_bsync_rdy_iswt0_cse <= (fsm_output[6]) & (~ (z_out[3]));
      reg_start_sync_mgc_bsync_vld_iswt0_cse <= ~(or_dcpl_11 | or_dcpl_10 | (fsm_output[7])
          | (fsm_output[4]) | (fsm_output[2]));
      reg_input_matrix2_rsc_REGISTER_FILE_re_core_psct_cse <= fsm_output[2];
      loop2_j_1_reg <= (MUX_v_4_2_2({z_out_3 , loop2_j_1_reg}, or_dcpl_10 | (fsm_output[2])))
          & (signext_4_1(~ or_dcpl_11));
      loop2_partial_out_sva <= (MUX_v_32_2_2({loop2_partial_out_sva_1 , loop2_partial_out_sva},
          and_dcpl & (~((fsm_output[5]) | (fsm_output[3]))))) & (signext_32_1(~ or_18_cse));
      loop3_k_1_reg <= (MUX_v_4_2_2({z_out_3 , loop3_k_1_reg}, fsm_output[3])) &
          (signext_4_1(~ or_18_cse));
      loop3_slc_itm <= z_out_1[2];
      loop2_slc_itm <= z_out_1[4];
    end
  end
  assign mux_15_nl = MUX_v_3_2_2({3'b110 , (loop1_i_1_sva[2:0])}, fsm_output[2]);
  assign mux_8_nl = MUX_v_3_2_2({(z_out_3[3:1]) , ({1'b0 , (loop3_k_1_reg[3:2])})},
      fsm_output[2]);
  assign xz_out = ({(mux_15_nl) , (~ (fsm_output[2])) , 1'b1}) + conv_u2u_3_5(mux_8_nl);
  assign z_out = xz_out[4:0];
  assign mux_10_nl = MUX_v_4_2_2({4'b1 , z_out_3}, fsm_output[4]);
  assign xz_out_1 = ({1'b1 , (~ (fsm_output[4])) , (~ (fsm_output[4])) , ((z_out_3[3:2])
      | (signext_2_1(fsm_output[4])))}) + conv_u2u_4_5(mux_10_nl);
  assign z_out_1 = xz_out_1[4:0];
  assign mux_11_nl = MUX_v_4_2_2({loop3_k_1_reg , loop1_i_1_sva}, fsm_output[4]);
  assign xz_out_2 = conv_u2u_4_5(mux_11_nl) + conv_u2u_4_5(loop2_j_1_reg);
  assign z_out_2 = xz_out_2[4:0];
  assign mux1h_12_nl = MUX1HOT_v_4_3_2({loop1_i_1_sva , loop2_j_1_reg , loop3_k_1_reg},
      {(fsm_output[6]) , (fsm_output[4]) , (fsm_output[2])});
  assign xz_out_3 = (mux1h_12_nl) + 4'b1;
  assign z_out_3 = xz_out_3[3:0];
  assign mux_13_nl = MUX_v_4_2_2({loop1_i_1_sva , loop3_k_1_reg}, fsm_output[2]);
  assign mux_14_nl = MUX_v_5_2_2({(({2'b10 , (z_out_2[4:2])}) + conv_u2s_4_5(~ loop1_i_1_sva))
      , (({2'b10 , (z_out_2[4:2])}) + conv_u2s_4_5(~ loop3_k_1_reg))}, fsm_output[2]);
  assign xz_out_4 = ({(mux_13_nl) , 2'b1}) + conv_s2u_5_6(mux_14_nl);
  assign z_out_4 = xz_out_4[5:0];

  function [15:0] MUX_v_16_2_2;
    input [31:0] inputs;
    input [0:0] sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[31:16];
      end
      1'b1 : begin
        result = inputs[15:0];
      end
      default : begin
        result = inputs[31:16];
      end
    endcase
    MUX_v_16_2_2 = result;
  end
  endfunction


  function [3:0] MUX_v_4_2_2;
    input [7:0] inputs;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[7:4];
      end
      1'b1 : begin
        result = inputs[3:0];
      end
      default : begin
        result = inputs[7:4];
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function [7:0] MUX_v_8_2_2;
    input [15:0] inputs;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[15:8];
      end
      1'b1 : begin
        result = inputs[7:0];
      end
      default : begin
        result = inputs[15:8];
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function [35:0] MUX_v_36_2_2;
    input [71:0] inputs;
    input [0:0] sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[71:36];
      end
      1'b1 : begin
        result = inputs[35:0];
      end
      default : begin
        result = inputs[71:36];
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction


  function [31:0] MUX_v_32_2_2;
    input [63:0] inputs;
    input [0:0] sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[63:32];
      end
      1'b1 : begin
        result = inputs[31:0];
      end
      default : begin
        result = inputs[63:32];
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function [31:0] signext_32_1;
    input [0:0] vector;
  begin
    signext_32_1= {{31{vector[0]}}, vector};
  end
  endfunction


  function [2:0] MUX_v_3_2_2;
    input [5:0] inputs;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[5:3];
      end
      1'b1 : begin
        result = inputs[2:0];
      end
      default : begin
        result = inputs[5:3];
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function [3:0] MUX1HOT_v_4_3_2;
    input [11:0] inputs;
    input [2:0] sel;
    reg [3:0] result;
    integer i;
  begin
    result = inputs[0+:4] & {4{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*4+:4] & {4{sel[i]}});
    MUX1HOT_v_4_3_2 = result;
  end
  endfunction


  function [4:0] MUX_v_5_2_2;
    input [9:0] inputs;
    input [0:0] sel;
    reg [4:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[9:5];
      end
      1'b1 : begin
        result = inputs[4:0];
      end
      default : begin
        result = inputs[9:5];
      end
    endcase
    MUX_v_5_2_2 = result;
  end
  endfunction


  function signed [31:0] conv_s2s_64_32 ;
    input signed [63:0]  vector ;
  begin
    conv_s2s_64_32 = vector[31:0];
  end
  endfunction


  function  [31:0] conv_u2u_16_32 ;
    input [15:0]  vector ;
  begin
    conv_u2u_16_32 = {{16{1'b0}}, vector};
  end
  endfunction


  function  [4:0] conv_u2u_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function signed [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_s2u_5_6 ;
    input signed [4:0]  vector ;
  begin
    conv_s2u_5_6 = {vector[4], vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    matrix_mult
//  Generated from file(s):
//    2) $PROJECT_HOME/MATRIX_MULT.cpp
// ------------------------------------------------------------------


module matrix_mult (
  start, done, output_rsc_z, output_valid_rsc_z, addr_rsc_z, clk, rst, input_matrix1_rsc_REGISTER_FILE_data_in,
      input_matrix1_rsc_REGISTER_FILE_addr_rd, input_matrix1_rsc_REGISTER_FILE_addr_wr,
      input_matrix1_rsc_REGISTER_FILE_re, input_matrix1_rsc_REGISTER_FILE_we, input_matrix1_rsc_REGISTER_FILE_data_out,
      input_matrix2_rsc_REGISTER_FILE_data_in, input_matrix2_rsc_REGISTER_FILE_addr_rd,
      input_matrix2_rsc_REGISTER_FILE_addr_wr, input_matrix2_rsc_REGISTER_FILE_re,
      input_matrix2_rsc_REGISTER_FILE_we, input_matrix2_rsc_REGISTER_FILE_data_out
);
  input start;
  output done;
  output [35:0] output_rsc_z;
  output output_valid_rsc_z;
  output [7:0] addr_rsc_z;
  input clk;
  input rst;
  output [15:0] input_matrix1_rsc_REGISTER_FILE_data_in;
  output [6:0] input_matrix1_rsc_REGISTER_FILE_addr_rd;
  output [6:0] input_matrix1_rsc_REGISTER_FILE_addr_wr;
  output input_matrix1_rsc_REGISTER_FILE_re;
  output input_matrix1_rsc_REGISTER_FILE_we;
  input [15:0] input_matrix1_rsc_REGISTER_FILE_data_out;
  output [15:0] input_matrix2_rsc_REGISTER_FILE_data_in;
  output [7:0] input_matrix2_rsc_REGISTER_FILE_addr_rd;
  output [7:0] input_matrix2_rsc_REGISTER_FILE_addr_wr;
  output input_matrix2_rsc_REGISTER_FILE_re;
  output input_matrix2_rsc_REGISTER_FILE_we;
  input [15:0] input_matrix2_rsc_REGISTER_FILE_data_out;


  // Interconnect Declarations
  wire [6:0] input_matrix1_rsc_REGISTER_FILE_addr_rd_core;
  wire [7:0] input_matrix2_rsc_REGISTER_FILE_addr_rd_core;
  wire [35:0] output_rsc_mgc_out_stdreg_d;
  wire [7:0] addr_rsc_mgc_out_stdreg_d;
  wire mgc_start_sync_mgc_bsync_vld_vd;
  wire mgc_done_sync_mgc_bsync_rdy_rd_core_sct;
  wire input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff;

  mgc_out_stdreg #(.rscid(3),
  .width(36)) output_rsc_mgc_out_stdreg (
      .d(output_rsc_mgc_out_stdreg_d),
      .z(output_rsc_z)
    );
  mgc_out_stdreg #(.rscid(4),
  .width(1)) output_valid_rsc_mgc_out_stdreg (
      .d(1'b1),
      .z(output_valid_rsc_z)
    );
  mgc_out_stdreg #(.rscid(5),
  .width(8)) addr_rsc_mgc_out_stdreg (
      .d(addr_rsc_mgc_out_stdreg_d),
      .z(addr_rsc_z)
    );
  mgc_bsync_vld #(.rscid(6),
  .ready(0),
  .valid(1)) mgc_start_sync_mgc_bsync_vld (
      .vd(mgc_start_sync_mgc_bsync_vld_vd),
      .vz(start)
    );
  mgc_bsync_rdy #(.rscid(7),
  .ready(1),
  .valid(0)) mgc_done_sync_mgc_bsync_rdy (
      .rd(mgc_done_sync_mgc_bsync_rdy_rd_core_sct),
      .rz(done)
    );
  matrix_mult_core matrix_mult_core_inst (
      .clk(clk),
      .rst(rst),
      .input_matrix1_rsc_REGISTER_FILE_data_out(input_matrix1_rsc_REGISTER_FILE_data_out),
      .input_matrix2_rsc_REGISTER_FILE_data_out(input_matrix2_rsc_REGISTER_FILE_data_out),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd_core(input_matrix1_rsc_REGISTER_FILE_addr_rd_core),
      .input_matrix2_rsc_REGISTER_FILE_addr_rd_core(input_matrix2_rsc_REGISTER_FILE_addr_rd_core),
      .output_rsc_mgc_out_stdreg_d(output_rsc_mgc_out_stdreg_d),
      .addr_rsc_mgc_out_stdreg_d(addr_rsc_mgc_out_stdreg_d),
      .mgc_start_sync_mgc_bsync_vld_vd(mgc_start_sync_mgc_bsync_vld_vd),
      .mgc_done_sync_mgc_bsync_rdy_rd_core_sct(mgc_done_sync_mgc_bsync_rdy_rd_core_sct),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_pff(input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff)
    );
  assign input_matrix1_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd = input_matrix1_rsc_REGISTER_FILE_addr_rd_core
      & ({{6{input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff}}, input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff});
  assign input_matrix1_rsc_REGISTER_FILE_addr_wr = 7'b0;
  assign input_matrix1_rsc_REGISTER_FILE_re = ~ input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff;
  assign input_matrix1_rsc_REGISTER_FILE_we = 1'b1;
  assign input_matrix2_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd = input_matrix2_rsc_REGISTER_FILE_addr_rd_core
      & ({{7{input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff}}, input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff});
  assign input_matrix2_rsc_REGISTER_FILE_addr_wr = 8'b0;
  assign input_matrix2_rsc_REGISTER_FILE_re = ~ input_matrix1_rsc_REGISTER_FILE_addr_rd_core_sct_iff;
  assign input_matrix2_rsc_REGISTER_FILE_we = 1'b1;
endmodule




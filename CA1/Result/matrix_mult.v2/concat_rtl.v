
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
//  Generated date: Fri Mar 29 21:07:08 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module matrix_mult_core_fsm (
  clk, rst, fsm_output, st_loop2_13_tr0, st_loop1_tr0
);
  input clk;
  input rst;
  output [16:0] fsm_output;
  reg [16:0] fsm_output;
  input st_loop2_13_tr0;
  input st_loop1_tr0;


  // FSM State Type Declaration for matrix_mult_core_fsm_1
  parameter
    st_main = 5'd0,
    st_main_1 = 5'd1,
    st_loop2 = 5'd2,
    st_loop2_1 = 5'd3,
    st_loop2_2 = 5'd4,
    st_loop2_3 = 5'd5,
    st_loop2_4 = 5'd6,
    st_loop2_5 = 5'd7,
    st_loop2_6 = 5'd8,
    st_loop2_7 = 5'd9,
    st_loop2_8 = 5'd10,
    st_loop2_9 = 5'd11,
    st_loop2_10 = 5'd12,
    st_loop2_11 = 5'd13,
    st_loop2_12 = 5'd14,
    st_loop2_13 = 5'd15,
    st_loop1 = 5'd16,
    state_x = 5'b00000;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;

  always @(st_loop2_13_tr0 or st_loop1_tr0 or state_var)
  begin : matrix_mult_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 17'b1;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 17'b10;
        state_var_NS = st_loop2;
      end
      st_loop2 : begin
        fsm_output = 17'b100;
        state_var_NS = st_loop2_1;
      end
      st_loop2_1 : begin
        fsm_output = 17'b1000;
        state_var_NS = st_loop2_2;
      end
      st_loop2_2 : begin
        fsm_output = 17'b10000;
        state_var_NS = st_loop2_3;
      end
      st_loop2_3 : begin
        fsm_output = 17'b100000;
        state_var_NS = st_loop2_4;
      end
      st_loop2_4 : begin
        fsm_output = 17'b1000000;
        state_var_NS = st_loop2_5;
      end
      st_loop2_5 : begin
        fsm_output = 17'b10000000;
        state_var_NS = st_loop2_6;
      end
      st_loop2_6 : begin
        fsm_output = 17'b100000000;
        state_var_NS = st_loop2_7;
      end
      st_loop2_7 : begin
        fsm_output = 17'b1000000000;
        state_var_NS = st_loop2_8;
      end
      st_loop2_8 : begin
        fsm_output = 17'b10000000000;
        state_var_NS = st_loop2_9;
      end
      st_loop2_9 : begin
        fsm_output = 17'b100000000000;
        state_var_NS = st_loop2_10;
      end
      st_loop2_10 : begin
        fsm_output = 17'b1000000000000;
        state_var_NS = st_loop2_11;
      end
      st_loop2_11 : begin
        fsm_output = 17'b10000000000000;
        state_var_NS = st_loop2_12;
      end
      st_loop2_12 : begin
        fsm_output = 17'b100000000000000;
        state_var_NS = st_loop2_13;
      end
      st_loop2_13 : begin
        fsm_output = 17'b1000000000000000;
        if ( st_loop2_13_tr0 ) begin
          state_var_NS = st_loop1;
        end
        else begin
          state_var_NS = st_loop2;
        end
      end
      st_loop1 : begin
        fsm_output = 17'b10000000000000000;
        if ( st_loop1_tr0 ) begin
          state_var_NS = st_main;
        end
        else begin
          state_var_NS = st_loop2;
        end
      end
      default : begin
        fsm_output = 17'b00000000000000000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= st_main;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core
// ------------------------------------------------------------------


module matrix_mult_core (
  clk, rst, input_matrix1_rsc_REGISTER_FILE_addr_rd, input_matrix1_rsc_REGISTER_FILE_re,
      input_matrix1_rsc_REGISTER_FILE_data_out, input_matrix2_rsc_REGISTER_FILE_addr_rd,
      input_matrix2_rsc_REGISTER_FILE_re, input_matrix2_rsc_REGISTER_FILE_data_out,
      output_rsc_mgc_out_stdreg_d, addr_rsc_mgc_out_stdreg_d
);
  input clk;
  input rst;
  output [83:0] input_matrix1_rsc_REGISTER_FILE_addr_rd;
  output [11:0] input_matrix1_rsc_REGISTER_FILE_re;
  input [191:0] input_matrix1_rsc_REGISTER_FILE_data_out;
  output [87:0] input_matrix2_rsc_REGISTER_FILE_addr_rd;
  output [10:0] input_matrix2_rsc_REGISTER_FILE_re;
  input [175:0] input_matrix2_rsc_REGISTER_FILE_data_out;
  output [35:0] output_rsc_mgc_out_stdreg_d;
  reg [35:0] output_rsc_mgc_out_stdreg_d;
  output [7:0] addr_rsc_mgc_out_stdreg_d;
  reg [7:0] addr_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [16:0] fsm_output;
  wire or_dcpl_6;
  wire or_dcpl_10;
  reg [3:0] loop1_i_1_sva;
  reg [3:0] reg_1;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_11_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_10_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_1_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_1_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_2_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_2_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_3_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_3_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_4_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_4_itm;
  reg [31:0] reg_2;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_5_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_5_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_6_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_6_itm;
  reg [31:0] loop3_reg;
  reg [31:0] loop3_acc_29_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_7_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_11_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_8_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_7_itm;
  reg [15:0] loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_9_itm;
  reg [15:0] loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_8_itm;
  reg [31:0] loop3_acc_itm;
  reg loop2_slc_itm;
  wire nor_4_seb;
  wire [4:0] and_53_rmff;
  wire [4:0] and_54_rmff;
  wire and_13_rmff;
  wire nand_tmp;
  wire [4:0] loop3_acc_11_itm;
  wire [5:0] xloop3_acc_11_itm;
  wire [3:0] and_59_itm;
  wire and_60_itm;
  wire [31:0] z_out;
  wire [31:0] xz_out;
  wire [31:0] z_out_1;
  wire [32:0] xz_out_1;
  wire [31:0] z_out_2;
  wire [32:0] xz_out_2;
  wire [3:0] z_out_3;
  wire [4:0] xz_out_3;
  wire [5:0] z_out_4;
  wire [6:0] xz_out_4;
  wire [3:0] loop3_acc_12_cse_sva;
  wire [4:0] xloop3_acc_12_cse_sva;
  wire [4:0] loop2_acc_4_sdt;
  wire [5:0] xloop2_acc_4_sdt;
  wire nor_6_cse;

  wire[1:0] mux_35_nl;
  wire[15:0] mux1h_12_nl;
  wire[15:0] mux1h_9_nl;
  wire[2:0] mux_38_nl;
  wire[2:0] mux_41_nl;
  wire[1:0] mux_42_nl;
  wire[4:0] mux_37_nl;
  matrix_mult_core_fsm matrix_mult_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .st_loop2_13_tr0((~ loop2_slc_itm)),
      .st_loop1_tr0((~ (z_out_3[3])))
    );
  assign nor_4_seb = ~(or_dcpl_10 | (fsm_output[12]) | (fsm_output[14]) | (fsm_output[13])
      | (fsm_output[11]) | (fsm_output[10]) | or_dcpl_6 | (fsm_output[6]) | (fsm_output[5])
      | (fsm_output[3]) | (fsm_output[0]) | ((fsm_output[16]) & (~ (z_out_3[3])))
      | ((~ loop2_slc_itm) & (fsm_output[15])));
  assign nand_tmp = ~(((fsm_output[2]) | nor_6_cse) & nor_4_seb);
  assign nor_6_cse = ~((fsm_output[16]) | (fsm_output[1]));
  assign xloop3_acc_11_itm = conv_u2u_4_5({2'b11 , (reg_1[3:2])}) + 5'b1;
  assign loop3_acc_11_itm = xloop3_acc_11_itm[4:0];
  assign xloop3_acc_12_cse_sva = reg_1 + 4'b1;
  assign loop3_acc_12_cse_sva = xloop3_acc_12_cse_sva[3:0];
  assign xloop2_acc_4_sdt = conv_u2u_4_5(loop1_i_1_sva) + conv_u2u_4_5(reg_1);
  assign loop2_acc_4_sdt = xloop2_acc_4_sdt[4:0];
  assign or_dcpl_6 = (fsm_output[9]) | (fsm_output[7]);
  assign or_dcpl_10 = (fsm_output[4]) | (fsm_output[8]);
  assign and_13_rmff = (fsm_output[2]) & nor_4_seb;
  assign and_59_itm = (readslicef_5_4_1((({1'b1 , (~ (loop1_i_1_sva[3:1])) , 1'b1})
      + ({(loop1_i_1_sva[2:0]) , 2'b1})))) & (signext_4_1(fsm_output[2]));
  assign and_60_itm = (readslicef_2_1_1((({(~ (loop1_i_1_sva[0])) , 1'b1}) + 2'b11)))
      & (fsm_output[2]);
  assign and_53_rmff = (({(loop1_i_1_sva[2:0]) , 2'b11}) + ({1'b1 , (~ loop1_i_1_sva)}))
      & (signext_5_1(fsm_output[2]));
  assign and_54_rmff = (({1'b1 , (~ loop1_i_1_sva)}) + ({(loop1_i_1_sva[2:0]) , 2'b1}))
      & (signext_5_1(fsm_output[2]));
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd = {and_59_itm , and_60_itm , 1'b0
      , (fsm_output[2]) , and_59_itm , and_60_itm , (fsm_output[2]) , 1'b0 , and_59_itm
      , and_60_itm , (signext_2_1(fsm_output[2])) , and_53_rmff , 2'b0 , and_53_rmff
      , 1'b0 , (fsm_output[2]) , and_53_rmff , (fsm_output[2]) , 1'b0 , and_53_rmff
      , (signext_2_1(fsm_output[2])) , and_54_rmff , 2'b0 , and_54_rmff , 1'b0 ,
      (fsm_output[2]) , and_54_rmff , (fsm_output[2]) , 1'b0 , and_54_rmff , (signext_2_1(fsm_output[2]))
      , and_59_itm , and_60_itm , 2'b0};
  assign input_matrix1_rsc_REGISTER_FILE_re = signext_12_1(~ (fsm_output[2]));
  assign mux_35_nl = MUX_v_2_2_2({(reg_1[3:2]) , (loop3_acc_11_itm[1:0])}, (fsm_output[2])
      & (~ nand_tmp));
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd = {1'b0 , and_13_rmff , 2'b0 , (loop3_acc_12_cse_sva
      & (signext_4_1(fsm_output[2])) & ({{3{nor_4_seb}}, nor_4_seb})) , 1'b0 , and_13_rmff
      , 1'b0 , (({z_out_3 , (reg_1[0])}) & (signext_5_1(fsm_output[2])) & ({{4{nor_4_seb}},
      nor_4_seb})) , 1'b0 , and_13_rmff , ((conv_u2u_4_6(reg_1) + 6'b11011) & (signext_6_1(fsm_output[2]))
      & ({{5{nor_4_seb}}, nor_4_seb})) , 1'b0 , and_13_rmff , and_13_rmff , (({(conv_u2u_1_2(reg_1[3])
      + 2'b1) , (reg_1[2:0]) , (conv_u2u_4_8(reg_1) + 8'b1110101)}) & (signext_13_1(fsm_output[2]))
      & ({{12{nor_4_seb}}, nor_4_seb})) , and_13_rmff , 3'b0 , (({((reg_1[3:1]) +
      3'b1) , (reg_1[0])}) & (signext_4_1(fsm_output[2])) & ({{3{nor_4_seb}}, nor_4_seb}))
      , and_13_rmff , 2'b0 , ((conv_u2u_4_5(reg_1) + 5'b1111) & (signext_5_1(fsm_output[2]))
      & ({{4{nor_4_seb}}, nor_4_seb})) , 2'b0 , and_13_rmff , ((conv_u2u_4_5(reg_1)
      + 5'b111) & (signext_5_1(fsm_output[2])) & ({{4{nor_4_seb}}, nor_4_seb})) ,
      3'b0 , ((conv_u2u_4_5(reg_1) + 5'b1101) & (signext_5_1(fsm_output[2])) & ({{4{nor_4_seb}},
      nor_4_seb})) , 2'b0 , (({(conv_u2u_3_5(reg_1[3:1]) + 5'b1101) , (reg_1[0])})
      & (signext_6_1(fsm_output[2])) & ({{5{nor_4_seb}}, nor_4_seb})) , 1'b0 , ((loop3_acc_11_itm[4:2])
      & (signext_3_1(fsm_output[2])) & ({{2{nor_4_seb}}, nor_4_seb})) , (({(mux_35_nl)
      , (reg_1[1:0])}) & (signext_4_1(~ nand_tmp)))};
  assign input_matrix2_rsc_REGISTER_FILE_re = ~(({10'b0 , (((fsm_output[16]) & (z_out_3[3]))
      | (fsm_output[1]) | (loop2_slc_itm & (fsm_output[15])))}) | (signext_11_1(fsm_output[2])));
  always @(posedge clk) begin
    if ( rst ) begin
      loop1_i_1_sva <= 4'b0;
      output_rsc_mgc_out_stdreg_d <= 36'b0;
      addr_rsc_mgc_out_stdreg_d <= 8'b0;
      reg_1 <= 4'b0;
      loop2_slc_itm <= 1'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_11_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_11_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_10_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_1_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_1_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_2_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_2_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_3_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_3_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_4_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_4_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_5_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_5_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_6_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_6_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_7_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_8_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_7_itm <= 16'b0;
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_9_itm <= 16'b0;
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_8_itm <= 16'b0;
      reg_2 <= 32'b0;
      loop3_reg <= 32'b0;
      loop3_acc_itm <= 32'b0;
      loop3_acc_29_itm <= 32'b0;
    end
    else begin
      loop1_i_1_sva <= (MUX_v_4_2_2({(z_out_4[3:0]) , loop1_i_1_sva}, nor_6_cse))
          & (signext_4_1(~ (fsm_output[1])));
      output_rsc_mgc_out_stdreg_d <= MUX_v_36_2_2({output_rsc_mgc_out_stdreg_d ,
          (signext_36_32((z_out_2 + loop3_acc_29_itm) + loop3_acc_itm))}, fsm_output[14]);
      addr_rsc_mgc_out_stdreg_d <= MUX_v_8_2_2({addr_rsc_mgc_out_stdreg_d , ({z_out_4
          , (loop2_acc_4_sdt[1:0])})}, fsm_output[2]);
      reg_1 <= (MUX_v_4_2_2({loop3_acc_12_cse_sva , reg_1}, or_dcpl_10 | (fsm_output[12])
          | (fsm_output[14]) | (fsm_output[13]) | (fsm_output[11]) | (fsm_output[10])
          | or_dcpl_6 | (fsm_output[6]) | (fsm_output[5]) | (fsm_output[3]) | (fsm_output[15])))
          & ({{3{nor_6_cse}}, nor_6_cse});
      loop2_slc_itm <= MUX_s_1_2_2({loop2_slc_itm , (readslicef_5_1_4((conv_u2s_4_5(loop3_acc_12_cse_sva)
          + 5'b10011)))}, fsm_output[2]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_11_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_11_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[15:0])}, fsm_output[2]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_11_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_11_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[15:0])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_10_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_10_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[15:0])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[191:176])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[175:160])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_1_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_1_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[175:160])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_1_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_1_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[159:144])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_2_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_2_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[159:144])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_2_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_2_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[143:128])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_3_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_3_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[143:128])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_3_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_3_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[127:112])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_4_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_4_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[127:112])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_4_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_4_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[111:96])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_5_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_5_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[111:96])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_5_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_5_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[95:80])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_6_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_6_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[95:80])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_6_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_6_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[79:64])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_7_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_7_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[79:64])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_8_itm <= MUX_v_16_2_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_8_itm
          , (input_matrix1_rsc_REGISTER_FILE_data_out[63:48])}, fsm_output[3]);
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_7_itm <= MUX_v_16_2_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_7_itm
          , (input_matrix2_rsc_REGISTER_FILE_data_out[47:32])}, fsm_output[3]);
      loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_9_itm <= input_matrix1_rsc_REGISTER_FILE_data_out[47:32];
      loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_8_itm <= input_matrix2_rsc_REGISTER_FILE_data_out[31:16];
      reg_2 <= z_out;
      loop3_reg <= MUX_v_32_2_2({z_out_1 , loop3_reg}, ~((fsm_output[4]) | (fsm_output[8])
          | (fsm_output[12])));
      loop3_acc_itm <= MUX_v_32_2_2({loop3_acc_itm , z_out_2}, fsm_output[6]);
      loop3_acc_29_itm <= MUX_v_32_2_2({loop3_acc_29_itm , z_out_2}, fsm_output[10]);
    end
  end
  assign mux1h_12_nl = MUX1HOT_v_16_12_2({loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_11_itm
      , (input_matrix1_rsc_REGISTER_FILE_data_out[31:16]) , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_8_itm
      , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_6_itm , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_4_itm
      , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_2_itm , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_itm
      , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_9_itm , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_5_itm
      , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_1_itm , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_7_itm
      , loop3_slc_input_matrix1_rsc_REGISTER_FILE_data_out_3_itm}, {(fsm_output[14])
      , (fsm_output[3]) , (fsm_output[5]) , (fsm_output[7]) , (fsm_output[9]) , (fsm_output[11])
      , (fsm_output[13]) , (fsm_output[4]) , (fsm_output[8]) , (fsm_output[12]) ,
      (fsm_output[6]) , (fsm_output[10])});
  assign mux1h_9_nl = MUX1HOT_v_16_12_2({loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_10_itm
      , (input_matrix2_rsc_REGISTER_FILE_data_out[63:48]) , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_7_itm
      , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_6_itm , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_4_itm
      , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_2_itm , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_itm
      , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_8_itm , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_5_itm
      , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_1_itm , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_11_itm
      , loop3_slc_input_matrix2_rsc_REGISTER_FILE_data_out_3_itm}, {(fsm_output[14])
      , (fsm_output[3]) , (fsm_output[5]) , (fsm_output[7]) , (fsm_output[9]) , (fsm_output[11])
      , (fsm_output[13]) , (fsm_output[4]) , (fsm_output[8]) , (fsm_output[12]) ,
      (fsm_output[6]) , (fsm_output[10])});
  assign xz_out = conv_u2u_16_32(mux1h_12_nl) * conv_u2u_16_32(mux1h_9_nl);
  assign z_out = xz_out[31:0];
  assign xz_out_1 = z_out + reg_2;
  assign z_out_1 = xz_out_1[31:0];
  assign xz_out_2 = z_out_1 + loop3_reg;
  assign z_out_2 = xz_out_2[31:0];
  assign mux_38_nl = MUX_v_3_2_2({(reg_1[3:1]) , 3'b11}, fsm_output[16]);
  assign xz_out_3 = ({(fsm_output[16]) , (mux_38_nl)}) + conv_u2u_3_4((z_out_4[3:1])
      | (signext_3_1(fsm_output[2])));
  assign z_out_3 = xz_out_3[3:0];
  assign mux_41_nl = MUX_v_3_2_2({(loop1_i_1_sva[2:0]) , ({(signext_2_1(loop1_i_1_sva[3]))
      , (loop1_i_1_sva[2])})}, fsm_output[16]);
  assign mux_42_nl = MUX_v_2_2_2({2'b1 , (loop1_i_1_sva[1:0])}, fsm_output[16]);
  assign mux_37_nl = MUX_v_5_2_2({(({2'b10 , (loop2_acc_4_sdt[4:2])}) + conv_u2s_4_5(~
      loop1_i_1_sva)) , 5'b1}, fsm_output[16]);
  assign xz_out_4 = ({(loop1_i_1_sva[3]) , (mux_41_nl) , (mux_42_nl)}) + conv_s2u_5_6(mux_37_nl);
  assign z_out_4 = xz_out_4[5:0];

  function [3:0] readslicef_5_4_1;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_5_4_1 = tmp[3:0];
  end
  endfunction


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function [0:0] readslicef_2_1_1;
    input [1:0] vector;
    reg [1:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_2_1_1 = tmp[0:0];
  end
  endfunction


  function [4:0] signext_5_1;
    input [0:0] vector;
  begin
    signext_5_1= {{4{vector[0]}}, vector};
  end
  endfunction


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function [11:0] signext_12_1;
    input [0:0] vector;
  begin
    signext_12_1= {{11{vector[0]}}, vector};
  end
  endfunction


  function [1:0] MUX_v_2_2_2;
    input [3:0] inputs;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[3:2];
      end
      1'b1 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[3:2];
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function [5:0] signext_6_1;
    input [0:0] vector;
  begin
    signext_6_1= {{5{vector[0]}}, vector};
  end
  endfunction


  function [12:0] signext_13_1;
    input [0:0] vector;
  begin
    signext_13_1= {{12{vector[0]}}, vector};
  end
  endfunction


  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
  end
  endfunction


  function [10:0] signext_11_1;
    input [0:0] vector;
  begin
    signext_11_1= {{10{vector[0]}}, vector};
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


  function [35:0] signext_36_32;
    input [31:0] vector;
  begin
    signext_36_32= {{4{vector[31]}}, vector};
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


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
  end
  endfunction


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


  function [15:0] MUX1HOT_v_16_12_2;
    input [191:0] inputs;
    input [11:0] sel;
    reg [15:0] result;
    integer i;
  begin
    result = inputs[0+:16] & {16{sel[0]}};
    for( i = 1; i < 12; i = i + 1 )
      result = result | (inputs[i*16+:16] & {16{sel[i]}});
    MUX1HOT_v_16_12_2 = result;
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


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_4_8 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_8 = {{4{1'b0}}, vector};
  end
  endfunction


  function  [4:0] conv_u2u_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 = {1'b0, vector};
  end
  endfunction


  function  [31:0] conv_u2u_16_32 ;
    input [15:0]  vector ;
  begin
    conv_u2u_16_32 = {{16{1'b0}}, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
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
  output_rsc_z, output_valid_rsc_z, addr_rsc_z, clk, rst, input_matrix1_rsc_REGISTER_FILE_data_in,
      input_matrix1_rsc_REGISTER_FILE_addr_rd, input_matrix1_rsc_REGISTER_FILE_addr_wr,
      input_matrix1_rsc_REGISTER_FILE_re, input_matrix1_rsc_REGISTER_FILE_we, input_matrix1_rsc_REGISTER_FILE_data_out,
      input_matrix2_rsc_REGISTER_FILE_data_in, input_matrix2_rsc_REGISTER_FILE_addr_rd,
      input_matrix2_rsc_REGISTER_FILE_addr_wr, input_matrix2_rsc_REGISTER_FILE_re,
      input_matrix2_rsc_REGISTER_FILE_we, input_matrix2_rsc_REGISTER_FILE_data_out
);
  output [35:0] output_rsc_z;
  output output_valid_rsc_z;
  output [7:0] addr_rsc_z;
  input clk;
  input rst;
  output [15:0] input_matrix1_rsc_REGISTER_FILE_data_in;
  output [83:0] input_matrix1_rsc_REGISTER_FILE_addr_rd;
  output [6:0] input_matrix1_rsc_REGISTER_FILE_addr_wr;
  output [11:0] input_matrix1_rsc_REGISTER_FILE_re;
  output input_matrix1_rsc_REGISTER_FILE_we;
  input [191:0] input_matrix1_rsc_REGISTER_FILE_data_out;
  output [15:0] input_matrix2_rsc_REGISTER_FILE_data_in;
  output [87:0] input_matrix2_rsc_REGISTER_FILE_addr_rd;
  output [7:0] input_matrix2_rsc_REGISTER_FILE_addr_wr;
  output [10:0] input_matrix2_rsc_REGISTER_FILE_re;
  output input_matrix2_rsc_REGISTER_FILE_we;
  input [175:0] input_matrix2_rsc_REGISTER_FILE_data_out;


  // Interconnect Declarations
  wire [35:0] output_rsc_mgc_out_stdreg_d;
  wire [7:0] addr_rsc_mgc_out_stdreg_d;
  wire [83:0] input_matrix1_rsc_REGISTER_FILE_addr_rd_reg;
  wire [11:0] input_matrix1_rsc_REGISTER_FILE_re_reg;
  wire [87:0] input_matrix2_rsc_REGISTER_FILE_addr_rd_reg;
  wire [10:0] input_matrix2_rsc_REGISTER_FILE_re_reg;

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
  matrix_mult_core matrix_mult_core_inst (
      .clk(clk),
      .rst(rst),
      .input_matrix1_rsc_REGISTER_FILE_addr_rd(input_matrix1_rsc_REGISTER_FILE_addr_rd_reg),
      .input_matrix1_rsc_REGISTER_FILE_re(input_matrix1_rsc_REGISTER_FILE_re_reg),
      .input_matrix1_rsc_REGISTER_FILE_data_out(input_matrix1_rsc_REGISTER_FILE_data_out),
      .input_matrix2_rsc_REGISTER_FILE_addr_rd(input_matrix2_rsc_REGISTER_FILE_addr_rd_reg),
      .input_matrix2_rsc_REGISTER_FILE_re(input_matrix2_rsc_REGISTER_FILE_re_reg),
      .input_matrix2_rsc_REGISTER_FILE_data_out(input_matrix2_rsc_REGISTER_FILE_data_out),
      .output_rsc_mgc_out_stdreg_d(output_rsc_mgc_out_stdreg_d),
      .addr_rsc_mgc_out_stdreg_d(addr_rsc_mgc_out_stdreg_d)
    );
  assign input_matrix1_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd = input_matrix1_rsc_REGISTER_FILE_addr_rd_reg;
  assign input_matrix1_rsc_REGISTER_FILE_addr_wr = 7'b0;
  assign input_matrix1_rsc_REGISTER_FILE_re = input_matrix1_rsc_REGISTER_FILE_re_reg;
  assign input_matrix1_rsc_REGISTER_FILE_we = 1'b1;
  assign input_matrix2_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd = input_matrix2_rsc_REGISTER_FILE_addr_rd_reg;
  assign input_matrix2_rsc_REGISTER_FILE_addr_wr = 8'b0;
  assign input_matrix2_rsc_REGISTER_FILE_re = input_matrix2_rsc_REGISTER_FILE_re_reg;
  assign input_matrix2_rsc_REGISTER_FILE_we = 1'b1;
endmodule




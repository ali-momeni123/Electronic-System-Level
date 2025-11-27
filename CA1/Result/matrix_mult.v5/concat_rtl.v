
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
//  Generated date: Fri Mar 29 21:12:26 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    matrix_mult_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module matrix_mult_core_fsm (
  clk, rst, fsm_output, st_loop3_tr0, st_loop2_1_tr0, st_loop1_tr0
);
  input clk;
  input rst;
  output [4:0] fsm_output;
  reg [4:0] fsm_output;
  input st_loop3_tr0;
  input st_loop2_1_tr0;
  input st_loop1_tr0;


  // FSM State Type Declaration for matrix_mult_core_fsm_1
  parameter
    st_main = 3'd0,
    st_loop3 = 3'd1,
    st_loop2 = 3'd2,
    st_loop2_1 = 3'd3,
    st_loop1 = 3'd4,
    state_x = 3'b000;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;

  always @(st_loop3_tr0 or st_loop2_1_tr0 or st_loop1_tr0 or state_var)
  begin : matrix_mult_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 5'b1;
        state_var_NS = st_loop3;
      end
      st_loop3 : begin
        fsm_output = 5'b10;
        if ( st_loop3_tr0 ) begin
          state_var_NS = st_loop2;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      st_loop2 : begin
        fsm_output = 5'b100;
        state_var_NS = st_loop2_1;
      end
      st_loop2_1 : begin
        fsm_output = 5'b1000;
        if ( st_loop2_1_tr0 ) begin
          state_var_NS = st_loop1;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      st_loop1 : begin
        fsm_output = 5'b10000;
        if ( st_loop1_tr0 ) begin
          state_var_NS = st_main;
        end
        else begin
          state_var_NS = st_loop3;
        end
      end
      default : begin
        fsm_output = 5'b00000;
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
  clk, rst, input_matrix1_rsc_REGISTER_FILE_addr_rd, input_matrix1_rsc_REGISTER_FILE_data_out,
      input_matrix2_rsc_REGISTER_FILE_addr_rd, input_matrix2_rsc_REGISTER_FILE_data_out,
      output_rsc_mgc_out_stdreg_d, addr_rsc_mgc_out_stdreg_d, input_matrix1_rsc_REGISTER_FILE_re_pff
);
  input clk;
  input rst;
  output [6:0] input_matrix1_rsc_REGISTER_FILE_addr_rd;
  input [15:0] input_matrix1_rsc_REGISTER_FILE_data_out;
  output [7:0] input_matrix2_rsc_REGISTER_FILE_addr_rd;
  input [15:0] input_matrix2_rsc_REGISTER_FILE_data_out;
  output [35:0] output_rsc_mgc_out_stdreg_d;
  reg [35:0] output_rsc_mgc_out_stdreg_d;
  output [7:0] addr_rsc_mgc_out_stdreg_d;
  reg [7:0] addr_rsc_mgc_out_stdreg_d;
  output input_matrix1_rsc_REGISTER_FILE_re_pff;


  // Interconnect Declarations
  wire [4:0] fsm_output;
  wire or_dcpl_19;
  wire and_dcpl_4;
  wire and_dcpl_6;
  reg [3:0] loop1_i_1_sva;
  reg [3:0] loop2_j_1_reg;
  reg [31:0] loop2_partial_out_reg;
  reg [3:0] loop3_k_1_sva;
  reg loop3_stage_0;
  reg [2:0] loop1_i_slc_loop1_i_1_itm;
  reg [1:0] loop3_k_slc_loop3_k_3_itm;
  reg [1:0] loop3_k_slc_loop3_k_1_itm;
  reg loop3_asn_9_itm_1;
  reg loop3_stage_0_2;
  reg loop2_slc_itm;
  wire or_20_cse;
  wire [3:0] z_out;
  wire [4:0] xz_out;
  wire [4:0] z_out_1;
  wire [5:0] xz_out_1;
  wire [3:0] z_out_2;
  wire [4:0] xz_out_2;
  wire [5:0] z_out_3;
  wire [6:0] xz_out_3;
  wire [31:0] loop2_partial_out_sva_1_mx0w0;
  wire [32:0] xloop2_partial_out_sva_1_mx0w0;
  wire [3:0] loop3_k_1_sva_mx1;

  wire[2:0] mux_15_nl;
  wire[3:0] mux_16_nl;
  wire[3:0] mux1h_18_nl;
  wire[3:0] mux_18_nl;
  wire[4:0] mux_19_nl;
  matrix_mult_core_fsm matrix_mult_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .st_loop3_tr0((~ loop3_stage_0)),
      .st_loop2_1_tr0((~ loop2_slc_itm)),
      .st_loop1_tr0((~ (z_out[3])))
    );
  assign xloop2_partial_out_sva_1_mx0w0 = loop2_partial_out_reg + conv_s2s_64_32(conv_u2u_16_32(input_matrix1_rsc_REGISTER_FILE_data_out)
      * conv_u2u_16_32(input_matrix2_rsc_REGISTER_FILE_data_out));
  assign loop2_partial_out_sva_1_mx0w0 = xloop2_partial_out_sva_1_mx0w0[31:0];
  assign loop3_k_1_sva_mx1 = z_out_2 & (signext_4_1(fsm_output[1]));
  assign or_dcpl_19 = (fsm_output[4]) | (fsm_output[0]);
  assign or_20_cse = or_dcpl_19 | (fsm_output[3]);
  assign and_dcpl_4 = ~((fsm_output[4]) | (fsm_output[0]));
  assign and_dcpl_6 = (fsm_output[1]) & loop3_stage_0;
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd = ({((({loop1_i_slc_loop1_i_1_itm
      , 2'b1}) + conv_u2u_2_5(loop3_k_slc_loop3_k_3_itm)) + ({1'b1 , (~ loop1_i_1_sva)}))
      , loop3_k_slc_loop3_k_1_itm}) & ({{6{and_dcpl_6}}, and_dcpl_6});
  assign input_matrix1_rsc_REGISTER_FILE_re_pff = ~ and_dcpl_6;
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd = ({z_out_3 , (z_out_1[1:0])}) &
      ({{7{and_dcpl_6}}, and_dcpl_6});
  always @(posedge clk) begin
    if ( rst ) begin
      loop3_asn_9_itm_1 <= 1'b0;
      loop2_partial_out_reg <= 32'b0;
      loop1_i_1_sva <= 4'b0;
      loop2_j_1_reg <= 4'b0;
      addr_rsc_mgc_out_stdreg_d <= 8'b0;
      loop3_stage_0 <= 1'b0;
      loop3_k_1_sva <= 4'b0;
      loop3_stage_0_2 <= 1'b0;
      output_rsc_mgc_out_stdreg_d <= 36'b0;
      loop3_k_slc_loop3_k_1_itm <= 2'b0;
      loop3_k_slc_loop3_k_3_itm <= 2'b0;
      loop1_i_slc_loop1_i_1_itm <= 3'b0;
      loop2_slc_itm <= 1'b0;
    end
    else begin
      loop3_asn_9_itm_1 <= ~ (z_out[2]);
      loop2_partial_out_reg <= (MUX_v_32_2_2({loop2_partial_out_sva_1_mx0w0 , loop2_partial_out_reg},
          ~((~((~ loop3_stage_0_2) | loop3_asn_9_itm_1)) | or_20_cse))) & (signext_32_1(~
          or_20_cse));
      loop1_i_1_sva <= (MUX_v_4_2_2({z_out_2 , loop1_i_1_sva}, and_dcpl_4)) & (signext_4_1(~
          (fsm_output[0])));
      loop2_j_1_reg <= (MUX_v_4_2_2({z_out_2 , loop2_j_1_reg}, (fsm_output[1]) |
          (fsm_output[3]))) & (signext_4_1(~ or_dcpl_19));
      addr_rsc_mgc_out_stdreg_d <= MUX_v_8_2_2({addr_rsc_mgc_out_stdreg_d , ({z_out_3
          , (z_out_1[1:0])})}, fsm_output[2]);
      loop3_stage_0 <= (loop3_stage_0 & (z_out[2])) | or_20_cse;
      loop3_k_1_sva <= z_out_2 & (signext_4_1(~ or_20_cse));
      loop3_stage_0_2 <= loop3_stage_0 & (~ or_20_cse);
      output_rsc_mgc_out_stdreg_d <= MUX_v_36_2_2({(signext_36_32(MUX_v_32_2_2({loop2_partial_out_reg
          , loop2_partial_out_sva_1_mx0w0}, loop3_stage_0_2))) , output_rsc_mgc_out_stdreg_d},
          (~ (fsm_output[1])) | loop3_stage_0);
      loop3_k_slc_loop3_k_1_itm <= loop3_k_1_sva_mx1[1:0];
      loop3_k_slc_loop3_k_3_itm <= loop3_k_1_sva_mx1[3:2];
      loop1_i_slc_loop1_i_1_itm <= (MUX_v_3_2_2({(z_out_2[2:0]) , (loop1_i_1_sva[2:0])},
          and_dcpl_4)) & (signext_3_1(~ (fsm_output[0])));
      loop2_slc_itm <= readslicef_5_1_4((conv_u2s_4_5(z_out_2) + 5'b10011));
    end
  end
  assign mux_15_nl = MUX_v_3_2_2({3'b1 , (z_out_2[3:1])}, fsm_output[4]);
  assign xz_out = ({1'b1 , (~ (fsm_output[4])) , ((z_out_2[3:2]) | (signext_2_1(fsm_output[4])))})
      + conv_u2u_3_4(mux_15_nl);
  assign z_out = xz_out[3:0];
  assign mux_16_nl = MUX_v_4_2_2({loop3_k_1_sva , loop1_i_1_sva}, fsm_output[2]);
  assign xz_out_1 = conv_u2u_4_5(mux_16_nl) + conv_u2u_4_5(loop2_j_1_reg);
  assign z_out_1 = xz_out_1[4:0];
  assign mux1h_18_nl = MUX1HOT_v_4_3_2({loop2_j_1_reg , loop3_k_1_sva , loop1_i_1_sva},
      {(fsm_output[2]) , (fsm_output[1]) , (fsm_output[4])});
  assign xz_out_2 = (mux1h_18_nl) + 4'b1;
  assign z_out_2 = xz_out_2[3:0];
  assign mux_18_nl = MUX_v_4_2_2({loop1_i_1_sva , loop3_k_1_sva}, fsm_output[1]);
  assign mux_19_nl = MUX_v_5_2_2({(({2'b10 , (z_out_1[4:2])}) + conv_u2s_4_5(~ loop1_i_1_sva))
      , (({2'b10 , (z_out_1[4:2])}) + conv_u2s_4_5(~ loop3_k_1_sva))}, fsm_output[1]);
  assign xz_out_3 = ({(mux_18_nl) , 2'b1}) + conv_s2u_5_6(mux_19_nl);
  assign z_out_3 = xz_out_3[5:0];

  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
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


  function [35:0] signext_36_32;
    input [31:0] vector;
  begin
    signext_36_32= {{4{vector[31]}}, vector};
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


  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
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


  function  [4:0] conv_u2u_2_5 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_5 = {{3{1'b0}}, vector};
  end
  endfunction


  function signed [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
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
  wire [35:0] output_rsc_mgc_out_stdreg_d;
  wire [7:0] addr_rsc_mgc_out_stdreg_d;
  wire [6:0] input_matrix1_rsc_REGISTER_FILE_addr_rd_reg;
  wire input_matrix1_rsc_REGISTER_FILE_re_iff;
  wire [7:0] input_matrix2_rsc_REGISTER_FILE_addr_rd_reg;

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
      .input_matrix1_rsc_REGISTER_FILE_data_out(input_matrix1_rsc_REGISTER_FILE_data_out),
      .input_matrix2_rsc_REGISTER_FILE_addr_rd(input_matrix2_rsc_REGISTER_FILE_addr_rd_reg),
      .input_matrix2_rsc_REGISTER_FILE_data_out(input_matrix2_rsc_REGISTER_FILE_data_out),
      .output_rsc_mgc_out_stdreg_d(output_rsc_mgc_out_stdreg_d),
      .addr_rsc_mgc_out_stdreg_d(addr_rsc_mgc_out_stdreg_d),
      .input_matrix1_rsc_REGISTER_FILE_re_pff(input_matrix1_rsc_REGISTER_FILE_re_iff)
    );
  assign input_matrix1_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix1_rsc_REGISTER_FILE_addr_rd = input_matrix1_rsc_REGISTER_FILE_addr_rd_reg;
  assign input_matrix1_rsc_REGISTER_FILE_addr_wr = 7'b0;
  assign input_matrix1_rsc_REGISTER_FILE_re = input_matrix1_rsc_REGISTER_FILE_re_iff;
  assign input_matrix1_rsc_REGISTER_FILE_we = 1'b1;
  assign input_matrix2_rsc_REGISTER_FILE_data_in = 16'b0;
  assign input_matrix2_rsc_REGISTER_FILE_addr_rd = input_matrix2_rsc_REGISTER_FILE_addr_rd_reg;
  assign input_matrix2_rsc_REGISTER_FILE_addr_wr = 8'b0;
  assign input_matrix2_rsc_REGISTER_FILE_re = input_matrix1_rsc_REGISTER_FILE_re_iff;
  assign input_matrix2_rsc_REGISTER_FILE_we = 1'b1;
endmodule




//  Catapult System Level Synthesis 2011a.41 (Production Release) Thu Apr  7 20:28:55 PDT 2011
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2011, All Rights Reserved.
//                       UNPUBLISHED, LICENSED SOFTWARE.
//            CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//          PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS
//  
//  Running on Windows 7 TA@TA-PC Service Pack 1 6.01.7601 i686
//  
//  Package information: SIFLIBS v17.0_1.1, HLS_PKGS v17.0_1.1, 
//                       DesignPad v2.78_0.0
//  
project new
solution file add {./MATRIX_MULT.cpp} -type C++
solution file add {./MATRIX_MULT.h} -type CHEADER
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -TRANSACTION_DONE_SIGNAL false
directive set -DONE_FLAG {}
directive set -START_FLAG {}
directive set -FSM_ENCODING none
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -RESET_CLEARS_ALL_REGS true
directive set -ASSIGN_OVERHEAD 0
directive set -DESIGN_GOAL area
directive set -OLD_SCHED false
directive set -CSA 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -PIPELINE_RAMP_UP true
directive set -COMPGRADE fast
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -UNROLL no
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS -1
go analyze
directive set -TECHLIBS {{mgc_sample-065nm-dw_beh_dc.lib mgc_sample-065nm-dw_beh_dc} {ram_sample-065nm-dualport_beh_dc.lib ram_sample-065nm-dualport_beh_dc} {ram_sample-065nm-register-file_beh_dc.lib ram_sample-065nm-register-file_beh_dc}}
directive set -CLOCK_NAME clk
directive set -CLOCKS {clk {-CLOCK_PERIOD 100.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 50.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_NAME {} -ENABLE_ACTIVE high}}
directive set -DESIGN_HIERARCHY __CPR195__matrix_mult__FPA12_32ac_int__tm__18_XCiL_2_16XCbL_1_0PA13_J19JP32ac_int__tm__18_XCiL_2_36XCbL_1_0P31ac_int__tm__17_XCiL_1_1XCbL_1_0P31ac_int__tm__17_XCiL_1_8XCbL_1_0
go compile
directive set /matrix_mult/core/loop3 -PIPELINE_INIT_INTERVAL 0
directive set /matrix_mult/core/loop3 -UNROLL no
directive set /matrix_mult/core/loop2 -UNROLL no
directive set /matrix_mult/core/loop2 -PIPELINE_INIT_INTERVAL 0
directive set /matrix_mult/core/loop1 -PIPELINE_INIT_INTERVAL 1
directive set /matrix_mult/core/loop1 -UNROLL no
go architect
go extract

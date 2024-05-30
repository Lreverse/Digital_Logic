// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Nov  3 15:00:42 2022
// Host        : LAPTOP-PEJNOK47 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Xilinx/Vivado/My_project/Mod_12/Mod_12.srcs/sources_1/ip/JK_0/JK_0_stub.v
// Design      : JK_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "JK,Vivado 2020.1" *)
module JK_0(clk, reset, set, J, K, Q)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,set,J,K,Q" */;
  input clk;
  input reset;
  input set;
  input J;
  input K;
  output Q;
endmodule

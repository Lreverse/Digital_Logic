-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Nov  3 15:00:42 2022
-- Host        : LAPTOP-PEJNOK47 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Xilinx/Vivado/My_project/Mod_12/Mod_12.srcs/sources_1/ip/JK_0/JK_0_stub.vhdl
-- Design      : JK_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    set : in STD_LOGIC;
    J : in STD_LOGIC;
    K : in STD_LOGIC;
    Q : out STD_LOGIC
  );

end JK_0;

architecture stub of JK_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,set,J,K,Q";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "JK,Vivado 2020.1";
begin
end;

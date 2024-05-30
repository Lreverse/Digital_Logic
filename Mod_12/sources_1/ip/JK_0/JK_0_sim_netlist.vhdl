-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Nov  3 15:00:42 2022
-- Host        : LAPTOP-PEJNOK47 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Vivado/My_project/Mod_12/Mod_12.srcs/sources_1/ip/JK_0/JK_0_sim_netlist.vhdl
-- Design      : JK_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity JK_0_JK is
  port (
    Q : out STD_LOGIC;
    clk : in STD_LOGIC;
    set : in STD_LOGIC;
    reset : in STD_LOGIC;
    J : in STD_LOGIC;
    K : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of JK_0_JK : entity is "JK";
end JK_0_JK;

architecture STRUCTURE of JK_0_JK is
  signal Q_C_i_1_n_0 : STD_LOGIC;
  signal Q_reg_C_n_0 : STD_LOGIC;
  signal Q_reg_LDC_i_1_n_0 : STD_LOGIC;
  signal Q_reg_LDC_i_2_n_0 : STD_LOGIC;
  signal Q_reg_LDC_n_0 : STD_LOGIC;
  signal Q_reg_P_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Q_C_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of Q_INST_0 : label is "soft_lutpair0";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of Q_reg_LDC : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of Q_reg_LDC : label is "LDC";
  attribute OPT_MODIFIED of Q_reg_P : label is "MLO";
begin
Q_C_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3A333AAA"
    )
        port map (
      I0 => J,
      I1 => K,
      I2 => Q_reg_P_n_0,
      I3 => Q_reg_LDC_n_0,
      I4 => Q_reg_C_n_0,
      O => Q_C_i_1_n_0
    );
Q_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q_reg_P_n_0,
      I1 => Q_reg_LDC_n_0,
      I2 => Q_reg_C_n_0,
      O => Q
    );
Q_reg_C: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => Q_reg_LDC_i_2_n_0,
      D => Q_C_i_1_n_0,
      Q => Q_reg_C_n_0
    );
Q_reg_LDC: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => Q_reg_LDC_i_2_n_0,
      D => '1',
      G => set,
      GE => '1',
      Q => Q_reg_LDC_n_0
    );
Q_reg_LDC_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => set,
      O => Q_reg_LDC_i_1_n_0
    );
Q_reg_LDC_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      O => Q_reg_LDC_i_2_n_0
    );
Q_reg_P: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => Q_C_i_1_n_0,
      PRE => Q_reg_LDC_i_1_n_0,
      Q => Q_reg_P_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity JK_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    set : in STD_LOGIC;
    J : in STD_LOGIC;
    K : in STD_LOGIC;
    Q : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of JK_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of JK_0 : entity is "JK_0,JK,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of JK_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of JK_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of JK_0 : entity is "JK,Vivado 2020.1";
end JK_0;

architecture STRUCTURE of JK_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.JK_0_JK
     port map (
      J => J,
      K => K,
      Q => Q,
      clk => clk,
      reset => reset,
      set => set
    );
end STRUCTURE;

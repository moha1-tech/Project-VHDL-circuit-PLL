
--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date:   15:02:42 03/08/2019
-- Design Name:   Circuit_PLL
-- Module Name:   E:/TP_VHDL/Circuit_PLL/tb.vhd
-- Project Name:  Circuit_PLL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Circuit_PLL
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_vhd IS
END tb_vhd;

ARCHITECTURE behavior OF tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Circuit_PLL
	PORT(
		CLK : IN std_logic;          
		PLL2x : OUT std_logic;
		PLL4x : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL CLK :  std_logic := '0';

	--Outputs
	SIGNAL PLL2x :  std_logic;
	SIGNAL PLL4x :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Circuit_PLL PORT MAP(
		CLK => CLK,
		PLL2x => PLL2x,
		PLL4x => PLL4x
	);

	tb : PROCESS
	BEGIN

		CLK <= '0' ;    wait for 10 ns;
		CLK <= '1' ;    wait for 10 ns;	
	
	END PROCESS;

END;

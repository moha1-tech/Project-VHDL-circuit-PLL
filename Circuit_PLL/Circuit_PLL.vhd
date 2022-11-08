----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:25 03/08/2019 
-- Design Name: 
-- Module Name:    Circuit_PLL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Circuit_PLL is
    Port ( CLK : in  STD_LOGIC;
           PLL2x , PLL4x : out  STD_LOGIC);
			  
end Circuit_PLL;

architecture Behavioral of Circuit_PLL is
signal CLK_IBUFG , CLK2X_BUFG , CLK2X  , CLK4X_BUFG ,  Q , NOT_Q : std_logic ;
signal CLK4X , LOCKED4X_OBUF , LOCKED4X , LOCKED2X : std_logic ;
begin

IBUFG_COPY: IBUFG port map (I => CLK , O =>CLK_IBUFG); 

CLK_DLL_COPY1 : CLKDLL PORT MAP (CLKIN => CLK_IBUFG , CLKFB => CLK2X_BUFG , RST => '0' , CLK0 => open ,
CLK90 => open , CLK180 => open , CLK270 => open , CLK2X => CLK2X , CLKDV => open , LOCKED => LOCKED2X); 

BUFG_COPY1: BUFG PORT MAP(I => CLK2X , O => CLK2X_BUFG);
BUFG_COPY2: BUFG PORT MAP(I => CLK4X , O => CLK4X_BUFG);

SRL16_COPY : SRL16 PORT MAP ( D => LOCKED2X , CLK => CLK2X_BUFG , A0 => '0' , A1 => '0' ,A2 => '0' ,A3 => '0' , Q => Q ); 


NOT_Q <= NOT(Q) ;

OBUF_COPY: OBUF PORT MAP ( I => LOCKED4X , O => LOCKED4X_OBUF);  

CLK_DLL_COPY2 : CLKDLL PORT MAP (CLKIN => CLK2X_BUFG , CLKFB => CLK2X_BUFG , RST => NOT_Q , CLK0 => open ,
CLK90 => open , CLK180 => open , CLK270 => open , CLK2X => CLK4X , CLKDV => open , LOCKED => LOCKED4X); 


PLL2X <= CLK2X_BUFG when LOCKED2X = '1' ELSE '0' ;


PLL4X <= CLK4X_BUFG when LOCKED4X = '1' ELSE '0' ;
 
end Behavioral;

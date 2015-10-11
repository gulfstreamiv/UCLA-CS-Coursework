--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:10:02 01/28/2015
-- Design Name:   
-- Module Name:   C:/Users/152/Desktop/OURLAB/lab2/testing.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: converter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testing IS
END testing;
 
ARCHITECTURE behavior OF testing IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT converter
    PORT(
         D : IN  std_logic_vector(11 downto 0);
         S : OUT  std_logic;
         E : OUT  std_logic_vector(2 downto 0);
         F : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic;
   signal E : std_logic_vector(2 downto 0);
   signal F : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: converter PORT MAP (
          D => D,
          S => S,
          E => E,
          F => F
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

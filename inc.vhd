-- File: inc.vhd
-- Generated by MyHDL 0.11
-- Date: Fri Apr 23 15:23:53 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_011.all;

entity inc is
    port (
        count: inout unsigned(7 downto 0);
        enable: in std_logic;
        clock: in std_logic;
        reset: in std_logic
    );
end entity inc;
-- Incrementer with enable.
-- 
-- count -- output
-- enable -- control input, increment when 1
-- clock -- clock input
-- reset -- asynchronous reset input

architecture MyHDL of inc is




begin




INC_SEQ: process (clock, reset) is
begin
    if (reset = '0') then
        count <= to_unsigned(0, 8);
    elsif rising_edge(clock) then
        if bool(enable) then
            count <= (count + 1);
        end if;
    end if;
end process INC_SEQ;

end architecture MyHDL;
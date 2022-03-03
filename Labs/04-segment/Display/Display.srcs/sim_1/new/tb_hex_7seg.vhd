------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_hex_7seg is
    -- Entity of testbench is always empty
end entity tb_hex_7seg;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_hex_7seg is

    -- Local signals
    signal s_hex  : std_logic_vector(4 - 1 downto 0);
    signal s_seg  : std_logic_vector(7 - 1 downto 0);

begin
    -- Connecting testbench signals with decoder entity
    -- (Unit Under Test)
    uut_hex_7seg : entity work.hex_7seg
        port map(
            hex_i => s_hex,
            seg_o => s_seg
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- First test case
        s_hex <= "0000"; wait for 50 ns; --0
        assert (s_seg = "0000001")
        report "Input combination 0000 FAILED" severity error;

        s_hex <= "0001"; wait for 50 ns; --1
        assert (s_seg = "1001111")
        report "Input combination 0001 FAILED" severity error;

        s_hex <= "0010"; wait for 50 ns; --2
        assert (s_seg = "0010010")
        report "Input combination 0010 FAILED" severity error;

        s_hex <= "0011"; wait for 50 ns; --3
        assert (s_seg = "0000110")
        report "Input combination 0011 FAILED" severity error;

        s_hex <= "0100"; wait for 50 ns; --4
        assert (s_seg = "1001100")
        report "Input combination 0100 FAILED" severity error;

        s_hex <= "0101"; wait for 50 ns; --5
        assert (s_seg = "0100100")
        report "Input combination 0101 FAILED" severity error;
        
        s_hex <= "0110"; wait for 50 ns; --6
        assert (s_seg = "0100000")
        report "Input combination 0110 FAILED" severity error;        

        s_hex <= "0111"; wait for 50 ns; --7
        assert (s_seg = "0001111")
        report "Input combination 0111 FAILED" severity error;        

        s_hex <= "1000"; wait for 50 ns; --8
        assert (s_seg = "0000000")
        report "Input combination 1000 FAILED" severity error;

        s_hex <= "1001"; wait for 50 ns; --9
        assert (s_seg = "0000100")
        report "Input combination 1001 FAILED" severity error;

        s_hex <= "1010"; wait for 50 ns; --A
        assert (s_seg = "0001000")
        report "Input combination 1010 FAILED" severity error;

        s_hex <= "1011"; wait for 50 ns; --b
        assert (s_seg = "1100000")
        report "Input combination 1011 FAILED" severity error;

        s_hex <= "1100"; wait for 50 ns; --C
        assert (s_seg = "0110001")
        report "Input combination 1100 FAILED" severity error;

        s_hex <= "1101"; wait for 50 ns; --d
        assert (s_seg = "1000010")
        report "Input combination 1101 FAILED" severity error;
        
        s_hex <= "1110"; wait for 50 ns; --E
        assert (s_seg = "0110000")
        report "Input combination 1110 FAILED" severity error;        

        s_hex <= "1111"; wait for 50 ns; --F
        assert (s_seg = "0111000")
        report "Input combination 1111 FAILED" severity error;        

    
        report "Stimulus process finished. You're great, bro." severity note;
        wait;
    end process p_stimulus;

end architecture testbench;

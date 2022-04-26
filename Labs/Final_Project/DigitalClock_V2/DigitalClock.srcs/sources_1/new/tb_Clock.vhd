------------------------------------------------------------------------
--  Clock testbench.
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_Clock is
    -- Entity of testbench is always empty
end entity tb_Clock;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_Clock is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 100 ns;

    --Local signals
    signal s_clk_100MHz   : std_logic;
    signal s_rst        : std_logic;
    signal s_H1    : std_logic_vector(3 downto 0);
    signal s_H2    : std_logic_vector(2 downto 0);
    signal s_M1    : std_logic_vector(3 downto 0);
    signal s_M2    : std_logic_vector(2 downto 0);
    signal s_S1    : std_logic_vector(3 downto 0);
    signal s_S2    : std_logic_vector(2 downto 0);


begin
    -- Connecting testbench signals with Clock entity
    -- (Unit Under Test)
    uut_Clock : entity work.Clock
        port map(
            clk  => s_clk_100MHz,
            rst  => s_rst,
            H1   => s_H1,
            H2   => s_H2,
            M1   => s_M1,
            M2   => s_M2,
            S1   => s_S1,
            S2   => s_S2
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 100 sec loop
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 500 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 500 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        
        
        
        report "Stimulus process finished" severity note;

        wait;
    end process p_stimulus;

end architecture testbench;

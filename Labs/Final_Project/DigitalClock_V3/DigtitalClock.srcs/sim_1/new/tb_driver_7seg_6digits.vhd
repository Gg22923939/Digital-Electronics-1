library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_6digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_6digits;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_driver_7seg_6digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz : std_logic;
    -- WRITE YOUR CODE HERE
    signal s_reset : std_logic;
    signal s_data0_i : std_logic_vector(4 - 1 downto 0);
    signal s_data1_i : std_logic_vector(4 - 1 downto 0);
    signal s_data2_i : std_logic_vector(4 - 1 downto 0);
    signal s_data3_i : std_logic_vector(4 - 1 downto 0);
    signal s_data4_i : std_logic_vector(4 - 1 downto 0);
    signal s_data5_i : std_logic_vector(4 - 1 downto 0);    
    signal s_dp_i : std_logic_vector(6 - 1 downto 0);
    signal s_dp_o : std_logic;
    signal s_seg_o : std_logic_vector(7 - 1 downto 0);
    signal s_dig_o : std_logic_vector(6 - 1 downto 0);
-----------------------------------------------------------------------------
    signal s_en         : std_logic;
    signal s_cnt_up     : std_logic;
    signal s_cnt        : std_logic_vector(3 - 1 downto 0);

begin
    -- Connecting testbench signals with driver_7seg_6digits
    -- entity (Unit Under Test)
    uut_driver_7seg_6digits : entity work.driver_7seg_6digits
        port map(
            clk      => s_clk_100MHz,
            reset    => s_reset,
            data0_i  => s_data0_i,
            data1_i  => s_data1_i,
            data2_i  => s_data2_i,
            data3_i  => s_data3_i,
            data4_i  => s_data4_i,
            data5_i  => s_data5_i,            
            dp_i     => s_dp_i,
            dp_o     => s_dp_o,
            seg_o    => s_seg_o,
            dig_o    => s_dig_o
        );
        
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_cnt : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH  => 3
        )
        port map(
            clk      => s_clk_100MHz,
            reset    => s_reset,
            en_i     => s_en,
            cnt_up_i => s_cnt_up,
            cnt_o    => s_cnt
        );

    uut_Clock : entity work.Clock
      port map(
         clk       => s_clk_100MHz,
         rst       => s_reset,
         H1        => s_data5_i,
         H2        => s_data4_i,
         M1        => s_data3_i,
         M2        => s_data2_i,
         S1        => s_data1_i,
         S2        => s_data0_i
);    


    --------------------------------------------
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 12 ns;
        -- Reset activated
        s_reset <= '1'; wait for 73 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;


    --------------------------------------------------------
    -- cnt_up_down   process
    --------------------------------------------------------
    p_cnt : process
    begin
    
        -- Enable counting
        s_en     <= '1';

        s_cnt_up <= '0';
    wait;
    end process p_cnt;
   
    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE
--    p_stimulus : process
--    begin
--        report "Stimulus process started" severity note;
        
--        s_data5_i <= "0001"; -- 1
--        s_data4_i <= "0000"; -- 0        
--        s_data3_i <= "0001"; -- 1
--        s_data2_i <= "0000"; -- 0
--        s_data1_i <= "0001"; -- 1       
--        s_data0_i <= "0000"; -- 0
--        s_dp_i    <= "011111";
        
        
--        report "Stimulus process finished" severity note;
--        wait;
--    end process p_stimulus;

end architecture testbench;

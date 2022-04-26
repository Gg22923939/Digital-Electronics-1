----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( CLK100MHZ : in STD_LOGIC; -- Main clock
           SW : in STD_LOGIC; -- Counter direction
           LED : out STD_LOGIC_VECTOR (3 downto 0);-- Counter value LED indicators
           CA : out STD_LOGIC; -- Cathod A
           CB : out STD_LOGIC; -- Cathod B
           CC : out STD_LOGIC; -- Cathod C
           CD : out STD_LOGIC; -- Cathod D
           CE : out STD_LOGIC; -- Cathod E
           CF : out STD_LOGIC; -- Cathod F
           CG : out STD_LOGIC; -- Cathod G
           DP : out STD_LOGIC; -- Decimal point
           AN : out STD_LOGIC_VECTOR (5 downto 0); -- Common anode signals to individual displays
           BTNC : in STD_LOGIC); -- Synchronous reset
end Top;


architecture Behavioral of top is

-- Internal clock enable
  signal s_en  : std_logic;
-- Internal counter
  signal s_cnt : std_logic_vector(3 - 1 downto 0);
  
  
  signal s_cnt5  : std_logic_vector(3 downto 0);
  signal s_cnt4  : std_logic_vector(3 downto 0);
  signal s_cnt3  : std_logic_vector(3 downto 0);
  signal s_cnt2  : std_logic_vector(3 downto 0);
  signal s_cnt1  : std_logic_vector(3 downto 0);
  signal s_cnt0  : std_logic_vector(3 downto 0);    
  
begin

  --------------------------------------------------------------------
  
  --Instance of Clock
  Clock_i : entity work.Clock
    port map(
        clk  => CLK100MHZ,
        rst  => BTNC,
        H1   => s_cnt5,
        H2   => s_cnt4,
        M1   => s_cnt3,
        M2   => s_cnt2,
        S1   => s_cnt1,
        S2   => s_cnt0
    );
  --------------------------------------------------------------------

  -- Instance (copy) of clock_enable entity
  clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 10000000
      )
      port map(
          clk   => CLK100MHZ,
          reset => BTNC,
          ce_o  => s_en
      );
      
  -- Instance (copy) of cnt_up_down entity
  bin_cnt0 : entity work.cnt_up_down
     generic map(
            g_CNT_WIDTH  => 3
      )
      port map(
            clk      => CLK100MHZ,
            reset    => BTNC,
            en_i     => s_en,
            cnt_up_i => SW,
            cnt_o    => s_cnt     
       );

  --------------------------------------------------------------------
  --------------------------------------------------------------------
  -- Instance (copy) of driver_7seg_6digits entity
  driver_seg_6_i : entity work.driver_7seg_6digits
      port map(
          clk      => CLK100MHZ,
          reset    => BTNC,
          data5_i  => s_cnt5,
          data4_i  => s_cnt4,
          data3_i  => s_cnt3,
          data2_i  => s_cnt2,
          data1_i  => s_cnt1,
          data0_i  => s_cnt0,
          dp_i     => "011111",
          dig_o    => AN,
          seg_o(6) => CA,
          seg_o(5) => CB,
          seg_o(4) => CC,
          seg_o(3) => CD,
          seg_o(2) => CE,
          seg_o(1) => CF,
          seg_o(0) => CG
      );

  -- Connect one common anode to 3.3V
  AN <= b"111_110";

  -- Display counter values on LEDs
  --LED(3 downto 0) <= s_cnt;

end architecture Behavioral;
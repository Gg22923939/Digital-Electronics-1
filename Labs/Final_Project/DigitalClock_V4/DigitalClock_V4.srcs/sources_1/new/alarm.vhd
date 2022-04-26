library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alarm is
port(
    clk : in std_logic;
    rst : in std_logic;
    c_H1  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    c_H2  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    c_M1  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    c_M2  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    c_S1  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    c_S2  : out std_logic_vector (3 downto 0); -- time digits from Clock.vhd
    
    a_H1  : out std_logic_vector (3 downto 0); -- time digits set here in the setalarm process
    a_H2  : out std_logic_vector (3 downto 0); -- time digits set here in the setalarm process
    a_M1  : out std_logic_vector (3 downto 0); -- time digits set here in the setalarm process
    a_M2  : out std_logic_vector (3 downto 0); -- time digits set here in the setalarm process
    a_S1  : out std_logic_vector (3 downto 0); --not sure if we want seconds in the alarm 
    a_S2  : out std_logic_vector (3 downto 0); -- time digits set here in the setalarm process
    BTNU  : in std_logic;     -- digit up
    BTND  : in std_logic;     -- digit down
    BTNR  : in std_logic;     -- next digit
    BTNL  : in std_logic      -- previous digit
);

end alarm;

architecture Behavioral of alarm is
signal    s_H1  : unsigned (3 downto 0) :=(others => '0');
signal    s_H2  : unsigned (3 downto 0) :=(others => '0');
signal    s_M1  : unsigned (3 downto 0) :=(others => '0');
signal    s_M2  : unsigned (3 downto 0) :=(others => '0');
signal    s_S1  : unsigned (3 downto 0) :=(others => '0');
signal    s_S2  : unsigned (3 downto 0) :=(others => '0');
signal    s_pst  : unsigned (2 downto 0) :=(others => '0'); -- position of the digit which we are changing
signal    s_BTNU : std_logic;
signal    s_BTND : std_logic;
signal    s_BTNL : std_logic;
signal    s_BTNR : std_logic;

begin

  Clock_i : entity work.Clock
    port map(
        clk  => clk,
        rst  => rst,
        H1   => c_H1,
        H2   => c_H2,
        M1   => c_M1,
        M2   => c_M2,
        S1   => c_S1,
        S2   => c_S2
    );

setalarm:process(clk)

begin
    if(rising_edge(clk)) then   -- setting the position of the digit which will be altered
       if(s_BTNR = '1') then
          if(s_pst < "0100") then
             s_pst <= s_pst + '1';
          else
             s_pst <= (others => '0');
          end if;
       elsif(s_BTNL = '1') then
          if(s_pst < "0000") then
             s_pst <= s_pst - '1';
          else
          s_pst <= (others => '0');
          end if;
       else
       end if;
    else
    end if;
    
    if(rising_edge(clk)) then   -- SETTING THE DIGITS FOR THE ALARM
       if (s_pst = '0') then    -- setting the H2 digit for the alarm
          if(s_BTNU = '1') then
             if(s_H2 < "0011") then
                s_H2 <= s_H2 + '1';            
             else
                s_H2 <= (others => '0');
             end if;
          elsif(s_BTND = '1') then   
             if (s_H2 < "0000") then
                 s_H2 <= s_H2 - '1';
             else
                 s_H2 <= (others => '0');
             end if;
          else   
          end if;
       elsif(s_pst = '1') then  -- setting the H1 digit for the alarm
          if(s_BTNU = '1') then
             if(s_H1 < "1001") then
                s_H1 <= s_H1 + '1';            
             else
                s_H1 <= (others => '0');
             end if;
          elsif(s_BTND = '1') then   
             if (s_H1 < "0000") then
                 s_H1 <= s_H1 - '1';
             else
                 s_H1 <= (others => '0');
             end if;
          else   
          end if;
       elsif(s_pst = '2') then  -- setting the M2 digit for the alarm
          if(s_BTNU = '1') then
             if(s_M2 < "0101") then
                s_M2 <= s_M2 + '1';            
             else
                s_M2 <= (others => '0');
             end if;
          elsif(s_BTND = '1') then   
             if (s_M2 < "0000") then
                 s_M2 <= s_M2 - '1';
             else
                 s_M2 <= (others => '0');
             end if;
          else   
          end if;
       else     -- setting the M1 digit for the alarm
          if(s_BTNU = '1') then
             if(s_M1 < "0101") then
                s_M1 <= s_M1 + '1';            
             else
                s_M1 <= (others => '0');
             end if;
          elsif(s_BTND = '1') then   
             if (s_M1 < "0000") then
                 s_M1 <= s_M1 - '1';
             else
                 s_M1 <= (others => '0');
             end if;
          else   
          end if;
       end if;
    else
    end if;
end process setalarm;

    a_H1 <= std_logic_vector(s_H1);
    a_H2 <= std_logic_vector(s_H2);
    a_M1 <= std_logic_vector(s_M1);
    a_M2 <= std_logic_vector(s_M2);
    
alarmsignal:process(clk)
begin
    if(rising_edge(clk)) then
       if(a_H2 = c_H2) and (a_H1 = c_H1) and (a_M2 = c_M2) and (a_M1 = c_M1) then
       -- send some sort of alarm a_H1
       else
       end if;
    else
    end if;

end process alarmsignal;

end Behavioral;

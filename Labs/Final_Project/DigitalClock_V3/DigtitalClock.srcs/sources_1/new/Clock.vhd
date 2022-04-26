library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock is
port(
    clk : in std_logic;
    rst : in std_logic;
    H1  : out std_logic_vector (3 downto 0);
    H2  : out std_logic_vector (3 downto 0);
    M1  : out std_logic_vector (3 downto 0);
    M2  : out std_logic_vector (3 downto 0);
    S1  : out std_logic_vector (3 downto 0);
    S2  : out std_logic_vector (3 downto 0)

);

end Clock;

architecture Behavioral of Clock is
signal    s_H1  : unsigned (3 downto 0) :=(others => '0');
signal    s_H2  : unsigned (3 downto 0) :=(others => '0');
signal    s_M1  : unsigned (3 downto 0) :=(others => '0');
signal    s_M2  : unsigned (3 downto 0) :=(others => '0');
signal    s_S1  : unsigned (3 downto 0) :=(others => '0');
signal    s_S2  : unsigned (3 downto 0) :=(others => '0');
signal    clkenable_o  : std_logic;

begin

clock_enable_i : entity work.clock_enable
    generic map(
        g_MAX => 100000000  -- Number of clk pulses to
                               -- generate one enable signal
                               -- period
    )  -- Note that there IS a semicolon between generic 
        -- and port sections
    port map(
        clk   => clk, -- Main clock
        reset => rst,-- Synchronous reset
        ce_o  => clkenable_o -- Clock enable pulse signal
    );

roll_over:process(clk)

begin
     if(rising_edge(clk)) then
        if rst = '1' then
            s_H1  <=(others => '0');
            s_H2  <=(others => '0');
            s_M1  <=(others => '0');
            s_M2  <=(others => '0');
            s_S1  <=(others => '0');
            s_S2  <=(others => '0');
        elsif(clkenable_o = '1') then
           
                if(s_S1 < "1001") then 
                   s_S1 <= s_S1 + 1;
                else 
                   s_S1 <= (others => '0');
                   if(s_S2 < "0101") then
                        s_S2 <= s_S2 + 1;
                   else
                        s_S2 <= (others => '0');
                        if(s_M1 < "1001") then
                            s_M1 <= s_M1 + 1;
                        else
                            s_M1 <= (others => '0');
                            if(s_M2 < "0101") then 
                                s_M2 <= s_M2 + 1;
                            else
                                s_M2 <= (others => '0');
                                if(s_H1 < "1001") and (s_H2 < "0010") then 
                                    s_H1 <= s_H1 + 1; 
                                else 
                                
                                    if(s_H1 = "1001") and (s_H2 < "0010") then 
                                        s_H1 <= (others => '0');
                                    else if (s_H1 = "0011") and (s_H2 = "0010") then 
                                    if (s_H2 < "0010") then
                                        s_H2 <= s_H2 + 1;
                                        s_H1 <= s_H1;
                                    else
                                        if (s_H1 = "0011") then
                                            s_H2 <= (others => '0');
                                            s_H1 <= (others => '0');
                                        else
                                            
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
                
       else
       
       
       
       end if;
    end if;


end process roll_over;

    H1 <= std_logic_vector(s_H1);
    H2 <= std_logic_vector(s_H2);
    M1 <= std_logic_vector(s_M1);
    M2 <= std_logic_vector(s_M2);
    S1 <= std_logic_vector(s_S1);
    S2 <= std_logic_vector(s_S2);

end Behavioral;

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

begin

roll_over:process(clk)

begin

    if rising_edge(clk) then
        if(s_S1 < "1001") then s_S1 <= s_S1 + 1;
        else 
        s_S2 <= s_S2 + 1;
        s_S1 <= (others => '0');
        if(s_S2 > "0100") then
            s_M1 <= s_M1 + 1;
            s_S2 <= (others => '0');
            if(s_M1 > "1000") then
                s_M2 <= s_M2 + 1;
                s_M1 <= (others => '0');
                if(s_M2 > "0100") then 
                    s_H1 <= s_H1 + 1;
                    s_M2 <= (others => '0');  
                    if(s_H1 > "1000") then 
                        s_H2 <= s_H2 + 1;
                        s_H1 <= (others => '0');
                    else if (s_H1 = "0011") and (s_H2 = "0010") then
                            s_H1 <= (others => '0');
                            s_H2 <= (others => '0');
                        end if;
                    end if;
                end if;
            end if;
        end if;
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

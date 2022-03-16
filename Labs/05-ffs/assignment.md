# Lab 5: Jia-Yang Wang

### Flip-flops

1. Listing of VHDL architecture for T-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active sync reset,
    -- rising-edge clk.
    -- q(n+1) = t./q(n) + /t.q(n)
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
    begin
    
        if rising_edge(clk) then  -- Synchronous process
            if(rst = '1') then   -- USE HIGH;-ACTIVE RESET HERE
                s_q <= '0';               
            else
                s_q <= ((t and (not(s_q))) or ((not t) and s_q));
            end if;
        end if;

    end process p_t_ff_rst;

    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   <img width="770" alt="Waveform" src="https://user-images.githubusercontent.com/99410896/158681428-8ea8654c-9dea-449b-ab69-44dfeba9de97.png">


### Shift register

1. Image of the shift register `top` level schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   
   <img width="684" alt="Shifter" src="https://user-images.githubusercontent.com/99410896/158682330-44eee6ac-a6f4-431d-890d-9e631a80d77f.png">


# Lab 5: Jia-Yang Wang

### Preparation tasks

<img width="529" alt="螢幕擷取畫面 2022-03-10 144108" src="https://user-images.githubusercontent.com/99410896/157673849-1da0ebe4-9121-44df-a1f5-cdeda4d8a5b7.png">
<img width="531" alt="螢幕擷取畫面 2022-03-10 144234" src="https://user-images.githubusercontent.com/99410896/157674003-1a5121d3-5230-4ca0-a160-fb939b621273.png">
<img width="527" alt="螢幕擷取畫面 2022-03-10 144316" src="https://user-images.githubusercontent.com/99410896/157674104-18393ec5-18bf-471b-a419-52e7ce370888.png">
<img width="736" alt="螢幕擷取畫面 2022-03-13 232756" src="https://user-images.githubusercontent.com/99410896/158081869-3630044b-cb66-469f-bdbf-c729adac2fa6.png">
<img width="744" alt="螢幕擷取畫面 2022-03-10 144441" src="https://user-images.githubusercontent.com/99410896/157674351-0385418f-afec-46cf-ac44-c1bbe7df7fd7.png">
<img width="727" alt="螢幕擷取畫面 2022-03-10 144501" src="https://user-images.githubusercontent.com/99410896/157674402-b8fbd238-eb10-489e-b207-63d469af3307.png">

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

        -- WRITE YOUR CODE HERE

    end process p_t_ff_rst;

    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure]()

### Shift register

1. Image of the shift register `top` level schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure]()

# Lab 6: Jia-Yang Wang

### Preparation tasks
1. See schematic or reference manual of the Nexys A7 board and find out the connection of these push buttons, ie to which FPGA pins are connected and how. What logic/voltage value do the buttons generate when not pressed and what value when the buttons are pressed? Draw the schematic with push buttons.

![image](https://user-images.githubusercontent.com/99410896/158815074-867f3496-f0b5-490f-8332-bc14aa175be6.png)

voltage value = 3.3V

2. Calculate how many periods of clock signal with frequency of 100 MHz contain time intervals 2 ms, 4 ms, 10 ms, 250 ms, 500 ms, and 1 s. Write values in decimal, binary, and hexadecimal forms.

![image](https://user-images.githubusercontent.com/99410896/158815716-94116f4d-7570-4d28-949f-694e3f13fa57.png)

![image](https://user-images.githubusercontent.com/99410896/158815732-17cc365b-2295-4814-9345-baeffa56ed17.png)

![image](https://user-images.githubusercontent.com/99410896/158818252-2095f53c-56ee-4c71-bbe2-460e9b951dcc.png)




### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_cnt_up_down:
    -- Clocked process with synchronous reset which implements
    -- n-bit up/down counter.
    --------------------------------------------------------
    p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then   -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then -- Test if counter is enabled
                -- TEST COUNTER DIRECTION HERE
                if cnt_up_i = '1' then
                    s_cnt_local <= s_cnt_local + 1;
                elsif cnt_up_i = '0' then
                    s_cnt_local <= s_cnt_local - 1; 
                end if;
            end if;
        end if;
    end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms. Test reset as well. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

<img width="944" alt="Waveform" src="https://user-images.githubusercontent.com/99410896/159771820-7d6dc0ac-807e-42b9-8c21-f80825dd13b7.png">


### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 16-bit counter with a 10 ms time base from *Experiments on your own*. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![Two counters](https://user-images.githubusercontent.com/99410896/159720091-bd52b515-90f1-4bef-b0a9-37b997724e77.jpg)


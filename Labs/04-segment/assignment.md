# Lab 4: Jia-Yang Wang
<table>
  <tr>
    <td>Hex</td>
    <td>Inputs</td>
    <td>A</td>
    <td>B</td>
    <td>C</td>
    <td>D</td>
    <td>E</td>
    <td>F</td>
    <td>G</td>
  </tr>
  <tr>
    <td>0</td>
    <td>0000</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
  <tr>
    <td>1</td>
    <td>0001</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>1</td> 
    <td>1</td>
  <tr>
    <td>2</td>
    <td>0010</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
  <tr>
    <td>3</td>
    <td>0011</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>1</td> 
    <td>0</td>
   <tr>
    <td>4</td>
    <td>0100</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>0</td> 
    <td>0</td>
  <tr>
    <td>5</td>
    <td>0101</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>6</td>
    <td>0110</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>7</td>
    <td>0111</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>1</td>
    <td>1</td>
   <tr>
    <td>8</td>
    <td>1000</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>9</td>
    <td>1001</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>A</td>
    <td>1010</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>B</td>
    <td>1011</td>
    <td>1</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>C</td>
    <td>1100</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
  <tr>
    <td>D</td>
    <td>1101</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
  <tr>
    <td>E</td>
    <td>1110</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  <tr>
    <td>F</td>
    <td>1111</td>
    <td>0</td>
    <td>1</td>
    <td>1</td>
    <td>1</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    
</table>

### Seven-segment display decoder

1. Listing of VHDL stimulus process from testbench file (`tb_hex_7seg.vhd`) with asserts. Verify all input combinations. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- First test case
        s_hex <= "0000"; wait for 50 ns;
        assert (s_seg = "0000001")
        report "Input combination 0000 FAILED" severity error;


        -- WRITE OTHER TEST CASES HERE
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

```

2. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](Screenshot_with_simulated_time_waveforms.png)

### LED(7:4) indicators

1. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd`. Try to write logic functions as simple as possible. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   ```vhdl
   --------------------------------------------------------------------
   -- Experiments on your own: LED(7:4) indicators

   -- Turn LED(4) on if input value is equal to 0, ie "0000"    
     LED(4) <= '1' when SW = "0000" else
                '0';
  
    -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
     LED(5) <= '1' when SW > "1001" else
                '0';

    -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
    -- Addittion properties of odd numbers: even + odd = odd
     LED(6) <= '1' when SW(0) = '1' else -- Wehn SW(0) = '1', other numbers (even) + 1 (odd) = odd
                '0';

    -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
    LED(7) <= '1' when SW = "0001" or -- 1
                        SW = "0010" or -- 2
                        SW = "0100" or -- 4
                        SW = "1000" else -- 8
               '0';

# Lab 4: Jia-Yang Wang
<table>
  <tr>
    <td>Hex</td>
    <td>Inputs</td>
    <td>A</td>
    <td>B</td>
    <td>C</td>
    <td>D</td>
    <td>F</td>
    <td>G</td>
  </tr>
  <tr>
    <td>0</td>
    <td>0000</td>
  <tr>
    <td>1</td>
    <td>0001</td>
  <tr>
    <td>2</td>
    <td>0010</td>
  <tr>
    <td>3</td>
    <td>0011</td>
   <tr>
    <td>4</td>
    <td>0100</td>
  <tr>
    <td>5</td>
    <td>0101</td>
  <tr>
    <td>6</td>
    <td>0110</td>
  <tr>
    <td>7</td>
    <td>0111</td>
   <tr>
    <td>8</td>
    <td>1000</td>
  <tr>
    <td>9</td>
    <td>1001</td>
  <tr>
    <td>A</td>
    <td>1010</td>
  <tr>
    <td>B</td>
    <td>1011</td>
  <tr>
    <td>C</td>
    <td>1100</td>
  <tr>
    <td>D</td>
    <td>1101</td>
  <tr>
    <td>E</td>
    <td>1110</td>
  <tr>
    <td>F</td>
    <td>1111</td>
    
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


        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure]()

### LED(7:4) indicators

1. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd`. Try to write logic functions as simple as possible. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   ```vhdl
   --------------------------------------------------------------------
   -- Experiments on your own: LED(7:4) indicators

   -- Turn LED(4) on if input value is equal to 0, ie "0000"
   -- LED(4) <= `0` when WRITE YOUR CODE HERE

   -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
   -- LED(5) <= WRITE YOUR CODE HERE

   -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
   -- LED(6) <= WRITE YOUR CODE HERE

   -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
   -- LED(7) <= WRITE YOUR CODE HERE
   ```

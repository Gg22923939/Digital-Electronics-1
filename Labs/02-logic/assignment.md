

# Lab 2: Jia-Yang Wang
### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](https://i.postimg.cc/zX4XDdfw/kmap-Greater-than.png)

   Less than:

   ![K-maps](https://i.postimg.cc/LX4mQwyS/kmap-Less-than.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](https://i.postimg.cc/52x12ZVC/Code-Cogs-Eqn.png)
   ![Logic functions](https://i.postimg.cc/SKh9RQKG/Code-Cogs-Eqn-1.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case

        s_b <= "0011"; --BCD_OF_YOUR_SECOND_LAST_ID_DIGIT ID: xxxx36
        s_a <= "0110"; --BCD_OF_YOUR_LAST_ID_DIGIT ID: xxxx36
        wait for 100 ns;

        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        report "Input combination 00, 00 FAILED" severity error;


        -- WRITE OTHER TEST CASES HERE
		

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
```

2. Text console screenshot during your simulation, including reports.

   ![your figure]()

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)

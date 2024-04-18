LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY servo_pwm_clk64kHz_tb IS
END servo_pwm_clk64kHz_tb;
 
ARCHITECTURE behavior OF servo_pwm_clk64kHz_tb IS
    -- Unit under test.
    COMPONENT servo_pwm_clk64kHz
        PORT(
            clk  : IN  STD_LOGIC;                    
            reset: IN  STD_LOGIC;                    
            sw : in std_logic_vector(1 downto 0);    
            pos  : IN  STD_LOGIC_VECTOR(6 downto 0); 
            servo_t: OUT STD_LOGIC_vector(3 downto 0)
        );
    END COMPONENT;

    -- Inputs.
    signal switch: std_logic_vector(1 downto 0);
    signal clk  : std_logic := '0';
    signal reset: std_logic := '0';
    signal pos  : std_logic_vector(6 downto 0) := (others => '0');
    -- Outputs.
    signal servo : std_logic_vector(3 downto 0);
    -- Clock definition.
    constant clk_period : time := 10 ns;
BEGIN
    -- Instance of the unit under test.
    uut: servo_pwm_clk64kHz PORT MAP (
        clk => clk,
        reset => reset,
        pos => pos,
        sw => switch,
        servo_t => servo
    );

   -- Definition of the clock process.
   clk_process :process begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;
 
    -- Stimuli process.
    stimuli: process begin
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 50 ns;
        switch <= "01";
        wait for 20ns;
        pos <= "0000000";
        wait for 20 ns;
        pos <= "1000000";
        wait for 200 ns;
        switch <= "00";
        wait for 20 ns;
        pos <= "1100000";
        --wait for 20 ms;
        --pos <= "1010000";
        --wait for 20 ms;
        --pos <= "1111000";
        --wait for 20 ms;
        --pos <= "1111111";
        wait;
    end process;
END;
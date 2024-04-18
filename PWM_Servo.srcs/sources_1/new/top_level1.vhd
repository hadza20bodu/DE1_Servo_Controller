library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_pwm_clk64kHz is
    PORT(
        clk  : IN  STD_LOGIC;
        reset: IN  STD_LOGIC;
        sw : in std_logic_vector(3 downto 0);   
        pos  : IN  STD_LOGIC_VECTOR(6 downto 0);
        LED : out std_logic_vector(3 downto 0);
        LED_P : out std_logic_vector(6 downto 0);
        servo_t: OUT STD_LOGIC_vector(3 downto 0)
    );
end servo_pwm_clk64kHz;

architecture Behavioral of servo_pwm_clk64kHz is
    COMPONENT clk64kHz
        PORT(
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT servo_pwm
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
            servo : OUT STD_LOGIC
        );
    END COMPONENT;
    
    signal clk_out : STD_LOGIC := '0';
    signal servo_out : STD_LOGIC := '0';
begin
    clk64kHz_map: clk64kHz PORT MAP(
        clk => clk,
        reset => reset,
        clk_out => clk_out
    );
    
    servo_pwm_map: servo_pwm PORT MAP(
        clk => clk_out,
        reset => reset,
        pos => pos,
        servo => servo_out
    );
    
  LED(0) <= sw(0);
  LED(1) <= sw(1);
  LED(2) <= sw(2);
  LED(3) <= sw(3);
  
  LED_P(0) <= pos(0);
  LED_P(1) <= pos(1);
  LED_P(2) <= pos(2);
  LED_P(3) <= pos(3);
  LED_P(4) <= pos(4);
  LED_P(5) <= pos(5);
  LED_P(6) <= pos(6);
    
  servo_t(0) <= servo_out when sw = "1000" else '0';
  servo_t(1) <= servo_out when sw = "0100" else '0';
  servo_t(2) <= servo_out when sw = "0010" else '0';
  servo_t(3) <= servo_out when sw = "0001" else '0';
end Behavioral;
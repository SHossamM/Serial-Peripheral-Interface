library verilog;
use verilog.vl_types.all;
entity slave is
    port(
        reset           : in     vl_logic;
        ss              : in     vl_logic;
        sck             : in     vl_logic;
        cpol            : in     vl_logic;
        cpoh            : in     vl_logic;
        MOSI            : in     vl_logic;
        reg1            : in     vl_logic_vector(7 downto 0);
        reg2            : in     vl_logic_vector(7 downto 0);
        reg3            : in     vl_logic_vector(7 downto 0);
        reg4            : in     vl_logic_vector(7 downto 0);
        reg5            : in     vl_logic_vector(7 downto 0);
        reg6            : in     vl_logic_vector(7 downto 0);
        reg7            : in     vl_logic_vector(7 downto 0);
        reg8            : in     vl_logic_vector(7 downto 0);
        MISO            : out    vl_logic
    );
end slave;

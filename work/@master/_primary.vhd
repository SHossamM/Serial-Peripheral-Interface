library verilog;
use verilog.vl_types.all;
entity Master is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sendOrder       : in     vl_logic;
        ssi             : in     vl_logic_vector(1 downto 0);
        address         : in     vl_logic_vector(7 downto 0);
        MISO            : in     vl_logic;
        cpol            : in     vl_logic;
        cpoh            : in     vl_logic;
        MOSI            : out    vl_logic;
        sensor          : out    vl_logic_vector(7 downto 0);
        ss1             : out    vl_logic;
        ss2             : out    vl_logic;
        ss3             : out    vl_logic;
        sck             : out    vl_logic
    );
end Master;

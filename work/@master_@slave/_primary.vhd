library verilog;
use verilog.vl_types.all;
entity Master_Slave is
    port(
        mode            : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        sendOrder       : in     vl_logic;
        ssi             : in     vl_logic_vector(1 downto 0);
        address         : in     vl_logic_vector(7 downto 0);
        reg11           : in     vl_logic_vector(7 downto 0);
        reg21           : in     vl_logic_vector(7 downto 0);
        reg31           : in     vl_logic_vector(7 downto 0);
        reg41           : in     vl_logic_vector(7 downto 0);
        reg51           : in     vl_logic_vector(7 downto 0);
        reg61           : in     vl_logic_vector(7 downto 0);
        reg71           : in     vl_logic_vector(7 downto 0);
        reg81           : in     vl_logic_vector(7 downto 0);
        reg12           : in     vl_logic_vector(7 downto 0);
        reg22           : in     vl_logic_vector(7 downto 0);
        reg32           : in     vl_logic_vector(7 downto 0);
        reg42           : in     vl_logic_vector(7 downto 0);
        reg52           : in     vl_logic_vector(7 downto 0);
        reg62           : in     vl_logic_vector(7 downto 0);
        reg72           : in     vl_logic_vector(7 downto 0);
        reg82           : in     vl_logic_vector(7 downto 0);
        reg13           : in     vl_logic_vector(7 downto 0);
        reg23           : in     vl_logic_vector(7 downto 0);
        reg33           : in     vl_logic_vector(7 downto 0);
        reg43           : in     vl_logic_vector(7 downto 0);
        reg53           : in     vl_logic_vector(7 downto 0);
        reg63           : in     vl_logic_vector(7 downto 0);
        reg73           : in     vl_logic_vector(7 downto 0);
        reg83           : in     vl_logic_vector(7 downto 0);
        sensor          : out    vl_logic_vector(7 downto 0)
    );
end Master_Slave;

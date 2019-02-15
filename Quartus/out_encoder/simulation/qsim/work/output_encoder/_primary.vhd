library verilog;
use verilog.vl_types.all;
entity output_encoder is
    port(
        WR              : out    vl_logic;
        RST             : in     vl_logic;
        Start_TX        : in     vl_logic;
        clk             : in     vl_logic;
        TX_Ready        : in     vl_logic;
        End_TX          : out    vl_logic;
        D_Out           : out    vl_logic_vector(7 downto 0);
        Time            : in     vl_logic_vector(15 downto 0)
    );
end output_encoder;

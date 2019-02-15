library verilog;
use verilog.vl_types.all;
entity output_encoder_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        RST             : in     vl_logic;
        Start_TX        : in     vl_logic;
        Time            : in     vl_logic_vector(15 downto 0);
        TX_Ready        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end output_encoder_vlg_sample_tst;

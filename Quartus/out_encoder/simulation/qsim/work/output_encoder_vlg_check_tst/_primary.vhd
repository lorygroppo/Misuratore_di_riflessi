library verilog;
use verilog.vl_types.all;
entity output_encoder_vlg_check_tst is
    port(
        D_Out           : in     vl_logic_vector(7 downto 0);
        End_TX          : in     vl_logic;
        WR              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end output_encoder_vlg_check_tst;

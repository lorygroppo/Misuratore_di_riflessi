onerror {quit -f}
vlib work
vlog -work work output_encoder.vo
vlog -work work output_encoder.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.output_encoder_vlg_vec_tst
vcd file -direction output_encoder.msim.vcd
vcd add -internal output_encoder_vlg_vec_tst/*
vcd add -internal output_encoder_vlg_vec_tst/i1/*
add wave /*
run -all

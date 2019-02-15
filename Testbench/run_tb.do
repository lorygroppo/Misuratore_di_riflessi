vsim -c work.tb_progetto_completo
add log sim:/tb_progetto_completo/*

run 0 ns
run 1 ms

quit -sim
quit -f
	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"TB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Counter.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Register.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Permutation.v
		
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 
	quit -sim
	cd file
	FC output_0.txt outputt_0.txt
	FC output_1.txt outputt_1.txt
	FC output_2.txt outputt_2.txt
	FC output_3.txt outputt_0.txt
	FC output_4.txt outputt_1.txt
	FC output_5.txt outputt_2.txt
	cd ..
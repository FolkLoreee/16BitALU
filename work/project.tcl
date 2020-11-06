set projDir "D:/Documents/alchitry/16BitALU/work/vivado"
set projName "16BitAluProject"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Documents/alchitry/16BitALU/work/verilog/au_top_0.v" "D:/Documents/alchitry/16BitALU/work/verilog/value_store_1.v" "D:/Documents/alchitry/16BitALU/work/verilog/edge_detector_2.v" "D:/Documents/alchitry/16BitALU/work/verilog/button_conditioner_3.v" "D:/Documents/alchitry/16BitALU/work/verilog/alu_4.v" "D:/Documents/alchitry/16BitALU/work/verilog/auto_tester_5.v" "D:/Documents/alchitry/16BitALU/work/verilog/reset_conditioner_6.v" "D:/Documents/alchitry/16BitALU/work/verilog/multi_seven_seg_7.v" "D:/Documents/alchitry/16BitALU/work/verilog/pipeline_8.v" "D:/Documents/alchitry/16BitALU/work/verilog/adder_9.v" "D:/Documents/alchitry/16BitALU/work/verilog/boolean_10.v" "D:/Documents/alchitry/16BitALU/work/verilog/shifter_11.v" "D:/Documents/alchitry/16BitALU/work/verilog/compare_12.v" "D:/Documents/alchitry/16BitALU/work/verilog/counter_13.v" "D:/Documents/alchitry/16BitALU/work/verilog/seven_seg_14.v" "D:/Documents/alchitry/16BitALU/work/verilog/decoder_15.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Documents/alchitry/16BitALU/work/constraint/alchitry.xdc" "D:/Documents/alchitry/16BitALU/work/constraint/io.xdc" "D:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

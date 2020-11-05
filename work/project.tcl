set projDir "/home/folkloreee/Documents/16BitAluProject/work/vivado"
set projName "16BitAluProject"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/folkloreee/Documents/16BitAluProject/work/verilog/au_top_0.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/value_store_1.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/edge_detector_2.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/button_conditioner_3.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/alu_4.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/auto_tester_5.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/reset_conditioner_6.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/multi_seven_seg_7.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/pipeline_8.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/adder_9.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/boolean_10.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/shifter_11.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/compare_12.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/counter_13.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/seven_seg_14.v" "/home/folkloreee/Documents/16BitAluProject/work/verilog/decoder_15.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/folkloreee/Documents/16BitAluProject/work/constraint/alchitry.xdc" "/home/folkloreee/Documents/alchitry-labs-1.2.0/library/components/au.xdc" "/home/folkloreee/Documents/16BitAluProject/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

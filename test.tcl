open_project C:/Users/UUA4KOR/Documents/Posit_Adder/Posit_Adder/Posit_Adder.xpr
add_files C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v
set_property top Posit_Addition_Test_benchh [get_filesets sim_1]
set_property top_file C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {100ms} -object [get_filesets sim_1]
launch_simulation
close_sim
close_project

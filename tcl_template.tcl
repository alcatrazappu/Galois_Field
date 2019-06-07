open_project %Project_Name%
add_files %Top_File%
set_property top %Top_Module% [get_filesets sim_1]
set_property top_file %Top_File% [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {%Run_Time%} -object [get_filesets sim_1]
launch_simulation
close_sim
close_project

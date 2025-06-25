using Revise                          # Imports the Revise package
using GENeSYS_MOD                     # Imports the GENeSYS_MOD package
using Gurobi                          # Imports GUROBI solver - Use if Gurobi installed#
using HiGHS                           # Imports HiGHS solver - Use if Gurobi installed#
using Ipopt                           # Imports Ipopt solver
using CSV                             # Imports CSV package
using DataFrames                      # Imports DataFrames package

data_dir = "Inputdata"                # Sets the data directory, input name of directory containing data files.
result_dir = "Results"                # Sets the results directory.
input_file = "insert_inputdata_!"   # Sets the input-file for obtaining general data, input file name.Update! Download newest inputdata!
hourly_file = "insert_Hourly_Data_!"    # Sets the input-file for obtaining hourly data, input file name.

gmod = genesysmod(;
    elmod_daystep = Int16(0),                   # Set Daystep
    elmod_hourstep = Int16(0),                  # Set Hourstep
    elmod_nthhour = Int16(964),                 # Set Nth Hour
    year = Int16(2018),                         # Set the BaseYear
    solver = Gurobi.Optimizer,                  # Choose the solver you use (eg. HiGHS or Gurobi...)
    DNLPsolver = Ipopt.Optimizer,               # Use Ipopt
    threads = Int16(8),                         # Choose Threads
    inputdir = data_dir,                        # inputdir as defined above
    data_file = input_file,                     # input_file as defined above
    hourly_data_file = hourly_file,             # hourly_file as defined above
    resultdir = result_dir,                     # Results Dir
    emissionPathway = "Low-Carbon",             # Name of Emission Pathwy
    emissionScenario = "Test_1",                # Name of Emissions Scenario
    model_region = "insert_region_!",                    # Define Model Region
    data_base_region = "insert_base_Region_!",                  # Define Data Base Region (Needs to the same as in Inputdata)
    switch_base_year_bounds = Int16(1),         # Turn BaseYearBounds on (1) or off (0)
    switch_processed_results = Int8(1),         # Turn processed results on (1) or off (0)
    switch_ccs = Int16(0),                      # Turn CCS on (1) or off (0)
    switch_investLimit = Int16(1),              # Turn investlimit on (1) or off (0)
    switch_cooking=Int8(0),                     # Decide if the model should include Cooking (1) or not (0)
    switch_base_year_bounds_debugging=Int8(0),  # Activate (1) or deactivate (0) baseyearbounds debugging
    switch_iis=Int8(0),                         # Activate (1) or deactivate (0) iis
    switch_infeasibility_tech = NoInfeasibilityTechs() # Turn infeasibility tech on: WithInfeasibilityTechs() or off:NoInfeasibilityTechs()
);

run(`powershell -Command "[console]::beep(600,300)"`)  ## Just a sound when finishing


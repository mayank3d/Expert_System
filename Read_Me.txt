Run using CLIPS 6.3
Running the program: 
	Run respective batch files for each data set given:	 
	execute_set1.bat	;For data set1
	execute_set2.bat	;For data set2
	execute_set3.bat	;For data set3


"Each batch file contains 5 separate CLIPS files and it'll load, reset and run by itself.

The path in execute_set.batch file need not be changed if it is in same directory as the program, if not then give the entire path of clips files into the batch file.
 
The final outcome of report will be displayed on the terminal.

Each batch file contains 3 files.
1. input_data_set.clp        =>  it has data set given for simulation, there are 3 separate files for input
2. populate_data2.clp       =>  it will generate city data from given input data
3. min_cost3.clp               =>  it will run min cost finding algorithm for each city pair
4. simulation4.clp            =>  it contains the simulation program that runs on the given data set 
5. reports5.clp	    =>  it runs when simulation ends and generates all the reports

Program structure
input_data_set.clp
	(city_name (city))
	(city_edge (cityA) (cityB) (dist))
	(package (p_number) (depart_city) (delivery_city) (size) (pkg_arr_time) (est_del_time)
	(truck (t_number) (cur_loc)(dest) (truck_space)(action)(package))
	(package_stats (p_number)  (status "nil") (pkg_pick_time ) (pkg_del_time) (pkg_wait_time ) (pkg_late_time ) (on_time_delivery "Yes"))	
	(truck_stats (t_number) (start_time ) (wait_time ) (busy_time) (loaded_travel_time) (empty_travel_time ) (package_delivered ) (total_load))
	(pkg_avg (tot_wait_time ) (num_late_pkg ) (tot_late_time))
	(city_link (city1)(city2))


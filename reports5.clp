(defrule print_truck_report_format
	(declare (salience -2))
	(clock ?clk)
	=>
	(assert (generate truck report 1))
	(printout t crlf "Truck_Num   Waiting_Time   Busy_Time   % Busy_Time   Pkg_Delivered   %_Occupancy   Empty_Travel   %_Time_Carrying_Load   "  crlf)
)

(defrule print_report
	?var <- (generate truck report ?t_num)
	(total_trucks ?num_of_trucks)
	(test (<= ?t_num ?num_of_trucks))
	?c<-(clock ?x)
	(truck (t_number ?t_num)(truck_space ?t_space))
	(truck_stats (t_number ?t_num) (start_time ?st) (wait_time ?wait_t) (busy_time ?busy_t) (loaded_travel_time ?load_trv_t) (empty_travel_time ?emp_trv_t) (package_delivered ?pkg_del) (total_load ?tot_load))
	=>
	(format t "%6d %12d %12d %14.2f %12d %14.2f %14d %14.2f%n"  ?t_num  ?wait_t  ?busy_t  (* 100 (/ ?busy_t ?x))  ?pkg_del  (* (/ ?tot_load (* ?t_space ?pkg_del)) 100)   ?emp_trv_t   (* (/ ?load_trv_t ?busy_t) 100) )
	(bind ?t_num (+ ?t_num 1))
	(retract ?var)
	(assert (generate truck report ?t_num))
)

(defrule pkg_report
	(generate truck report ?num)
	(total_trucks ?num_of_trucks)
	(test (> ?num ?num_of_trucks))
	=>
	(assert (generate package report 1))
	(printout t crlf "Pakage_Num    Wait_Time    Pick_Up_Time   Delivery_Time   On_Time    Delay  ")
	(printout t crlf)
)

(defrule print_pkg_reoprt
	?var <- (generate package report ?p_rep)
	(package_stats (p_number ?p_rep)  (status ?p_stat) (pkg_pick_time ?pick_t) (pkg_del_time ?p_del_t) (pkg_wait_time ?wait_t) (pkg_late_time ?late_t) (on_time_delivery ?on_time))
	(total_packages ?num_of_pkgs)
	(test (<= ?p_rep ?num_of_pkgs))
	=>
;	(format t "%6d %12d %12d %12d %16s %8d%n "  ?p_rep  ?wait_t  ?pick_t  ?p_del_t ?on_time  ?late_t) 
	(format t "%6d" ?p_rep)
	(format t "%12d" ?wait_t)
	(format t "%14d" ?pick_t)
	(format t "%14d" ?p_del_t)
	(format t "%18s" ?on_time)
	(format t "%8d" ?late_t)
	(printout t crlf)
	(retract ?var)
	(bind ?p_rep(+ ?p_rep 1))
	(assert (generate package report ?p_rep))
)

;;Generates average package report;;

(defrule avg_pkg_report
	(generate package report ?num)
	(total_packages ?num_of_pkgs)
	(test (> ?num ?num_of_pkgs))
	=>
	(assert (print average report))
	(printout  t crlf "Avg_wait_per_pkg    Packages_On_Time     Delayed_Packages    Avg_Delay_For_Late_Pkg    Avg_Delay_Per_Package" crlf) 
)

(defrule print_avg_pkg_report
	(print average report)
	(pkg_avg (tot_wait_time ?tot_wait_t) (num_late_pkg ?num_late_p) (tot_late_time ?tot_late_t))
	(total_packages ?tot_pkg)
	=>
	(format t "%10.2f %18d %20d %22.2f %22.2f %n"  (/ ?tot_wait_t ?tot_pkg) (- ?tot_pkg ?num_late_p)  ?num_late_p  (/ ?tot_late_t ?num_late_p) (/ ?tot_late_t ?tot_pkg))
	(printout t crlf)
)
(defrule Rule_4.3									;; truck reaches its destination city, change its current location and destination if "dispatched"
	(clock ?clk)
	?trk <- (truck (t_number ?t_num) (cur_loc ?x) (dest ?y&~"nil") (action ?ac&~"idle"))
	?trk_stat <- (truck_stats (t_number ?t_num) (start_time ?time_stamp) (busy_time ?busy_t))
	(city_link (city1 ?x) (city2 ?y) (cost ?z))
	(test (= ?z (- ?clk ?time_stamp)))
	=>
	(bind ?busy_t (+ ?busy_t (- ?clk ?time_stamp)))
	(modify ?trk (cur_loc ?y) (dest "nil"))
)

(defrule Rule_4.4 								;;Pick package if truck arrives pickup location
	(clock ?clk)
	?pkg <- (package (p_number ?p_num) (depart_city ?dep_ct) (delivery_city ?del_ct) (pkg_arr_time ?arr_t))
	?pkg_stat <- (package_stats (p_number ?p_num) (status "booked") (pkg_wait_time ?pkg_wait_t))
	?trk <- (truck (t_number ?t_num) (cur_loc ?dep_ct) (action "dispatched") (package ?p_num))
	?trk_stat <- (truck_stats (t_number ?t_num) (start_time ?time_stamp)(empty_travel_time ?emp_trv_t) (busy_time ?busy_t))
	=>
	(bind ?busy_t (+ ?busy_t (- ?clk ?time_stamp)))
	(bind ?emp_trv_t (+ ?emp_trv_t (- ?clk ?time_stamp)))
	(bind ?pkg_wait_t (- ?clk ?arr_t))
	(modify ?pkg_stat(status "picked") (pkg_wait_time ?pkg_wait_t) (pkg_pick_time ?clk))
	(modify ?trk(dest ?del_ct) (action "delivering"))
	(modify ?trk_stat (start_time ?clk) (empty_travel_time ?emp_trv_t) (busy_time ?busy_t))
)

(defrule Rule_4.5 							;; Drop the package if truck arrives destination location && package is on or before time
	(clock ?clk)
	?pkg <- (package (p_number ?p_num) (depart_city ?dep_ct) (delivery_city ?del_ct) (est_del_time ?edt))
	?pkg_stat <- (package_stats (p_number ?p_num) (status "picked") (pkg_late_time ?pkg_late_t) (pkg_wait_time ?pkg_wait_t))
	?trk <- (truck (t_number ?t_num) (cur_loc ?del_ct) (action "delivering") (package ?p_num))
	?trk_stat <- (truck_stats (t_number ?t_num) (start_time ?time_stamp) (busy_time ?busy_t) (loaded_travel_time ?load_trv_t) (package_delivered ?pkg_del))
	?a <- (pkg_avg (tot_wait_time ?tot_wait_t))
	(test (>= ?edt ?clk))	;;mkd_test
	=>
	(bind ?tot_wait_t(+ ?tot_wait_t ?pkg_wait_t))
	(bind ?pkg_del (+ ?pkg_del +1))
	(bind ?load_trv_t (+ ?load_trv_t (- ?clk ?time_stamp)))
	(bind ?busy_t (+ ?busy_t (- ?clk ?time_stamp)))
	(modify ?pkg_stat (status "delivered") (pkg_late_time 0) (pkg_del_time ?clk))	;;mkd_test
	(modify ?trk (action "idle") (dest "nil") (package "nil"))
	(modify ?trk_stat (start_time ?clk) (busy_time ?busy_t) (loaded_travel_time ?load_trv_t) (package_delivered ?pkg_del))
	(modify ?a(tot_wait_time ?tot_wait_t))
)


(defrule Rule_4.6 						;; Drop the package if truck arrives destination location && package delvery is delayed
	(clock ?clk)
	?pkg <- (package (p_number ?p_num) (depart_city ?dep_ct) (delivery_city ?del_ct) (est_del_time ?edt))
	?pkg_stat <- (package_stats (p_number ?p_num) (status "picked") (pkg_late_time ?pkg_late_t) (pkg_wait_time ?pkg_wait_t))
	?trk <- (truck (t_number ?t_num) (cur_loc ?del_ct) (action "delivering") (package ?p_num))
	?trk_stat <- (truck_stats (t_number ?t_num) (start_time ?time_stamp) (busy_time ?busy_t) (loaded_travel_time ?load_trv_t) (package_delivered ?pkg_del))
	?a <- (pkg_avg (tot_wait_time ?tot_wait_t) (num_late_pkg ?num_late_p) (tot_late_time ?tot_late_t))
	(test (< ?edt ?clk))
	=>
	(bind ?tot_wait_t(+ ?tot_wait_t ?pkg_wait_t))
	(bind ?pkg_del (+ ?pkg_del +1))
	(bind ?load_trv_t (+ ?load_trv_t (- ?clk ?time_stamp)))
	(bind ?busy_t (+ ?busy_t (- ?clk ?time_stamp)))
	(bind ?pkg_late_t (- ?clk ?edt))
	(bind ?tot_late_t (+ ?tot_late_t ?pkg_late_t))
	(bind ?num_late_p (+ ?num_late_p 1))
	(modify ?pkg_stat (status "delivered") (pkg_late_time ?pkg_late_t) (pkg_del_time ?clk) (on_time_delivery "No"))
	(modify ?trk (action "idle") (dest "nil") (package "nil"))
	(modify ?trk_stat (start_time ?clk) (busy_time ?busy_t) (loaded_travel_time ?load_trv_t) (package_delivered ?pkg_del))
	(modify ?a(tot_wait_time ?tot_wait_t) (num_late_pkg ?num_late_p) (tot_late_time ?tot_late_t))
)

(defrule Rule_4.1_pkg_order_arrives						;;Setting package status on order arrival;;
	(clock ?clk)
	?pkg      <- (package       (p_number ?p_num) (pkg_arr_time ?clk))
	?pkg_stat <- (package_stats (p_number ?p_num) (status ?p_st&"nil")) 
	=>
	(modify ?pkg_stat (status "waiting"))
)

(defrule Rule_4.2_assign_truck							;; If package is waiting, then book a truck for its pickup
	(clock ?clk)
	?pkg <- (package (p_number ?p_num) (depart_city ?dep_ct) (delivery_city ?del_ct) (size ?p_sz) (pkg_arr_time ?arr_t))
	?pkg_stat <- (package_stats (p_number ?p_num) (status "waiting"))
	?trk <- (truck (t_number ?t_num_next1) (cur_loc ?loc1) (truck_space ?avl_space1&:(>= ?avl_space1 ?p_sz))  (action "idle"))
	?trk_stat <- (truck_stats (t_number ?t_num_next1) (start_time ?time_stamp) (wait_time ?wait_t) (total_load ?tot_load))
	(city_link (city1 ?loc1) (city2 ?dep_ct) (cost ?dst1))
	(not (and (truck (t_number ?t_num_next2) (cur_loc ?loc2) (truck_space ?avl_space2&:(>= ?avl_space2 ?p_sz))  (action "idle")) (city_link (city1 ?loc2) (city2 ?dep_ct) (cost ?dst2&:(< ?dst2 ?dst1)))))
	=>
	(bind ?wait_t (+ ?wait_t (- ?clk ?time_stamp)))
	(bind ?tot_load (+ ?tot_load ?p_sz))
	(modify ?trk (action "dispatched") (dest ?dep_ct) (package ?p_num))
	(modify ?pkg_stat (status "booked"))
	(modify ?trk_stat (start_time ?clk) (wait_time ?wait_t) (total_load ?tot_load))	
)



(defrule Rule_4.7_Update_Clock										;;Constantly updating universal clock;;
	(declare (salience -1))
	?c<-(clock ?x)
	(package_stats (status ?pst))
	(test (neq ?pst "delivered"))
	=>
	(retract ?c)
	(bind ?x(+ ?x 1))
	(assert (clock ?x))
)

(defrule Rule_4.8_end_calibration
	(clock ?clk)
	?var <- (end_calibration_trucks ?t_num)					;; added in input_data1 specifically for this end calibration
	?trk_stat <- (truck_stats (t_number ?t_num)(wait_time ?wait_t) (start_time ?time_stamp))
	(not (package_stats (status ?pst&:(neq ?pst "delivered"))))
	=>
	(retract ?var)
	(bind ?wait_t(+ ?wait_t (- ?clk ?time_stamp)))
	(modify ?trk_stat (wait_time ?wait_t) (start_time ?clk))
)
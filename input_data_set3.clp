(deftemplate city_name "names of cities"
	(slot city)
)

(deffacts city_name_facts "cities"
	(city_name (city "Tallahassee"))
	(city_name (city "Lake City"))
	(city_name (city "Jacksonville"))
	(city_name (city "Gainesville"))
	(city_name (city "St. Augustine"))
	(city_name (city "Ocala"))
	(city_name (city "Orlando"))
	(city_name (city "Tampa"))
	(city_name (city "Ft. Myers"))
	(city_name (city "West Palm"))
	(city_name (city "Miami"))
	(city_name (city "Key West"))
)

(deftemplate city_edge "edges between cities"
	(slot cityA) (slot cityB) (slot dist)
)


(deffacts input_data "edges"
	(city_edge (cityA "Tallahassee")   (cityB "Lake City")     (dist 2))
	(city_edge (cityA "Lake City")     (cityB "Tallahassee")   (dist 2))
	(city_edge (cityA "Lake City")     (cityB "Jacksonville")  (dist 1))
	(city_edge (cityA "Lake City")     (cityB "Gainesville")   (dist 1))
	(city_edge (cityA "Jacksonville")  (cityB "Lake City")     (dist 1))
	(city_edge (cityA "Jacksonville")  (cityB "St. Augustine") (dist 1))
	(city_edge (cityA "Gainesville")   (cityB "Lake City")     (dist 1))
	(city_edge (cityA "Gainesville")   (cityB "St. Augustine") (dist 1))
	(city_edge (cityA "Gainesville")   (cityB "Ocala")         (dist 1))
	(city_edge (cityA "St. Augustine") (cityB "Jacksonville")  (dist 1))
	(city_edge (cityA "St. Augustine") (cityB "Gainesville")   (dist 1))
	(city_edge (cityA "St. Augustine") (cityB "Orlando")       (dist 2))
	(city_edge (cityA "St. Augustine") (cityB "West Palm")     (dist 3))
	(city_edge (cityA "Ocala")         (cityB "Gainesville")   (dist 1))
	(city_edge (cityA "Ocala")         (cityB "Orlando")       (dist 1))
	(city_edge (cityA "Ocala")         (cityB "Tampa")         (dist 2))
	(city_edge (cityA "Orlando")       (cityB "Ocala")         (dist 1))
	(city_edge (cityA "Orlando")       (cityB "St. Augustine") (dist 2))
	(city_edge (cityA "Orlando")       (cityB "Tampa")         (dist 1))
	(city_edge (cityA "Orlando")       (cityB "West Palm")     (dist 3))
	(city_edge (cityA "Tampa")         (cityB "Ocala")         (dist 2))
	(city_edge (cityA "Tampa")         (cityB "Orlando")       (dist 1))
	(city_edge (cityA "Tampa")         (cityB "Ft. Myers")     (dist 2))
	(city_edge (cityA "West Palm")     (cityB "St. Augustine") (dist 3))
	(city_edge (cityA "West Palm")     (cityB "Orlando")       (dist 3))
	(city_edge (cityA "West Palm")     (cityB "Ft. Myers")     (dist 3))
	(city_edge (cityA "West Palm")     (cityB "Miami")         (dist 2))
	(city_edge (cityA "Ft. Myers")     (cityB "Tampa")         (dist 2))
	(city_edge (cityA "Ft. Myers")     (cityB "West Palm")     (dist 3))
	(city_edge (cityA "Miami")         (cityB "West Palm")     (dist 2))
	(city_edge (cityA "Miami")         (cityB "Key West")      (dist 3))
	(city_edge (cityA "Key West")      (cityB "Miami")         (dist 3))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Entering Package input data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deftemplate package "Package Template"				
	(slot p_number) (slot depart_city) (slot delivery_city) (slot size) (slot pkg_arr_time) (slot est_del_time)
)



(deffacts package_data_input
	(package (p_number 50) (depart_city "Orlando")       (delivery_city "Key West")        (size 5)  (pkg_arr_time 1)   (est_del_time 5))
	(package (p_number 49) (depart_city "Tampa")         (delivery_city "Tallahassee")     (size 3)  (pkg_arr_time 2)   (est_del_time 4))
	(package (p_number 48) (depart_city "West Palm")     (delivery_city "Ft. Myers")       (size 5)  (pkg_arr_time 3)   (est_del_time 18))
	(package (p_number 47) (depart_city "Tallahassee")   (delivery_city "Lake City")       (size 5)  (pkg_arr_time 4)   (est_del_time 9))
	(package (p_number 46) (depart_city "West Palm")     (delivery_city "St. Augustine")   (size 15) (pkg_arr_time 5)   (est_del_time 10))
	(package (p_number 45) (depart_city "Miami")         (delivery_city "Orlando")         (size 8)  (pkg_arr_time 5)   (est_del_time 15))
	(package (p_number 44) (depart_city "Ft. Myers")     (delivery_city "Key West")        (size 6)  (pkg_arr_time 6)   (est_del_time 15))
	(package (p_number 43) (depart_city "Tampa")         (delivery_city "Jacksonville")    (size 14) (pkg_arr_time 7)   (est_del_time 17))
	(package (p_number 42) (depart_city "St. Augustine") (delivery_city "Key West")        (size 6)  (pkg_arr_time 9)   (est_del_time 25))
	(package (p_number 41) (depart_city "Tallahassee")   (delivery_city "Key West")        (size 14) (pkg_arr_time 10)  (est_del_time 32))
	(package (p_number 40) (depart_city "Lake City")     (delivery_city "Tallahassee")     (size 3)  (pkg_arr_time 12)  (est_del_time 19))
	(package (p_number 39) (depart_city "Tallahassee")   (delivery_city "Lake City")       (size 15) (pkg_arr_time 13)  (est_del_time 18))
	(package (p_number 38) (depart_city "Miami")         (delivery_city "Tallahassee")     (size 7)  (pkg_arr_time 15)  (est_del_time 30))
	(package (p_number 37) (depart_city "St. Augustine") (delivery_city "Tallahassee")     (size 18) (pkg_arr_time 15)  (est_del_time 31))
	(package (p_number 36) (depart_city "Gainesville")   (delivery_city "Orlando")         (size 2)  (pkg_arr_time 15)  (est_del_time 23))
	(package (p_number 35) (depart_city "Miami")         (delivery_city "Ocala")           (size 5)  (pkg_arr_time 16)  (est_del_time 30))
	(package (p_number 34) (depart_city "St. Augustine") (delivery_city "Ft. Myers")       (size 14) (pkg_arr_time 17)  (est_del_time 34))
	(package (p_number 33) (depart_city "Miami")         (delivery_city "Key West")        (size 4)  (pkg_arr_time 20)  (est_del_time 25))
	(package (p_number 32) (depart_city "Tampa")         (delivery_city "Tallahassee")     (size 12) (pkg_arr_time 25)  (est_del_time 40))
	(package (p_number 31) (depart_city "Miami")         (delivery_city "Gainesville")     (size 3)  (pkg_arr_time 30)  (est_del_time 45))
	(package (p_number 30) (depart_city "Orlando")       (delivery_city "Lake City")       (size 15) (pkg_arr_time 35)  (est_del_time 40))
	(package (p_number 29) (depart_city "West Palm")     (delivery_city "Ft. Myers")       (size 4)  (pkg_arr_time 35)  (est_del_time 43))
	(package (p_number 28) (depart_city "Miami")         (delivery_city "Orlando")         (size 15) (pkg_arr_time 37)  (est_del_time 47))
	(package (p_number 27) (depart_city "Ocala")         (delivery_city "Orlando")         (size 4)  (pkg_arr_time 40)  (est_del_time 50))
	(package (p_number 26) (depart_city "Jacksonville")  (delivery_city "Key West")        (size 11) (pkg_arr_time 40)  (est_del_time 55))
	(package (p_number 25) (depart_city "St. Augustine") (delivery_city "Ft. Myers")       (size 5)  (pkg_arr_time 45)  (est_del_time 58))
	(package (p_number 24) (depart_city "Tallahassee")   (delivery_city "Gainesville")     (size 4)  (pkg_arr_time 50)  (est_del_time 60))
	(package (p_number 23) (depart_city "Jacksonville")  (delivery_city "Tallahassee")     (size 3)  (pkg_arr_time 50)  (est_del_time 57))
	(package (p_number 22) (depart_city "Jacksonville")  (delivery_city "Key West")        (size 11) (pkg_arr_time 55)  (est_del_time 75))
	(package (p_number 21) (depart_city "Key West")      (delivery_city "St. Augustine")   (size 3)  (pkg_arr_time 55)  (est_del_time 67))
	(package (p_number 20) (depart_city "West Palm")     (delivery_city "St. Augustine")   (size 5)  (pkg_arr_time 55)  (est_del_time 67))
	(package (p_number 19) (depart_city "Gainesville")   (delivery_city "Tallahassee")     (size 12) (pkg_arr_time 60)  (est_del_time 70))
	(package (p_number 18) (depart_city "St. Augustine") (delivery_city "Ft. Myers")       (size 14) (pkg_arr_time 60)  (est_del_time 75))
	(package (p_number 17) (depart_city "Tampa")         (delivery_city "Tallahassee")     (size 13) (pkg_arr_time 62)  (est_del_time 75))
	(package (p_number 16) (depart_city "Gainesville")   (delivery_city "Orlando")         (size 1)  (pkg_arr_time 65)  (est_del_time 75))
	(package (p_number 15) (depart_city "Miami")         (delivery_city "Ocala")           (size 3)  (pkg_arr_time 70)  (est_del_time 80))
	(package (p_number 14) (depart_city "West Palm")     (delivery_city "Miami")           (size 12) (pkg_arr_time 70)  (est_del_time 80))
	(package (p_number 13) (depart_city "Orlando")       (delivery_city "Key West")        (size 9)  (pkg_arr_time 75)  (est_del_time 85))
	(package (p_number 12) (depart_city "Ft. Myers")     (delivery_city "Key West")        (size 5)  (pkg_arr_time 75)  (est_del_time 90))
	(package (p_number 11) (depart_city "Jacksonville")  (delivery_city "Miami")           (size 17) (pkg_arr_time 77)  (est_del_time 85))
	(package (p_number 10) (depart_city "Jacksonville")  (delivery_city "Orlando")         (size 4)  (pkg_arr_time 78)  (est_del_time 85))
	(package (p_number 9)  (depart_city "Miami")         (delivery_city "Tallahassee")     (size 13) (pkg_arr_time 78)  (est_del_time 95))
	(package (p_number 8)  (depart_city "Miami")         (delivery_city "Gainesville")     (size 6)  (pkg_arr_time 87)  (est_del_time 110))
	(package (p_number 7)  (depart_city "Gainesville")   (delivery_city "Tallahassee")     (size 10) (pkg_arr_time 90)  (est_del_time 100))
	(package (p_number 6)  (depart_city "Key West")      (delivery_city "St. Augustine")   (size 5)  (pkg_arr_time 94)  (est_del_time 105))
	(package (p_number 5)  (depart_city "West Palm")     (delivery_city "St. Augustine")   (size 14) (pkg_arr_time 94)  (est_del_time 100))
	(package (p_number 4)  (depart_city "Jacksonville")  (delivery_city "Key West")        (size 5)  (pkg_arr_time 95)  (est_del_time 110))
	(package (p_number 3)  (depart_city "St. Augustine") (delivery_city "Ft. Myers")       (size 12) (pkg_arr_time 95)  (est_del_time 117))
	(package (p_number 2)  (depart_city "Gainesville")   (delivery_city "Jacksonville")    (size 4)  (pkg_arr_time 100) (est_del_time 120))
	(package (p_number 1)  (depart_city "Orlando")       (delivery_city "Jacksonville")    (size 12) (pkg_arr_time 100) (est_del_time 120))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Entering Truck input data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deftemplate truck "Truck Template"				;;Truck data input;;
	(slot t_number) (slot cur_loc) (slot dest) (slot truck_space) (slot action) (slot package)
)

(deffacts truck_data_input
	
	(truck (t_number 7)  (cur_loc "Ft. Myers")    (truck_space 20)   (action "idle"))
	(truck (t_number 6)  (cur_loc "Miami")        (truck_space 15)   (action "idle"))
	(truck (t_number 5)  (cur_loc "Jacksonville") (truck_space 15)   (action "idle"))
	(truck (t_number 4)  (cur_loc "Ocala")        (truck_space 10)   (action "idle"))
	(truck (t_number 3)  (cur_loc "Ft. Myers")    (truck_space 10)   (action "idle"))
	(truck (t_number 2)  (cur_loc "West Palm")    (truck_space 5)    (action "idle"))
	(truck (t_number 1)  (cur_loc "Key West")     (truck_space 5)    (action "idle"))
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Entering Statistics data    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(deftemplate package_stats "Package statistics"				;;For storing package statistics;;
	(slot p_number) (slot status) (slot pkg_pick_time) (slot pkg_del_time) (slot pkg_wait_time) (slot pkg_late_time) (slot on_time_delivery)
)

(deffacts package_statistics
	(package_stats (p_number 1)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 2)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 3)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 4)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 5)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 6)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 7)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 8)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 9)  (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 10) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 11) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 12) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 13) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 14) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 15) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 16) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 17) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 18) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 19) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 20) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 21) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 22) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 23) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 24) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 25) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 26) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 27) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 28) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 29) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 30) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 31) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 32) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 33) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 34) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 35) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 36) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 37) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 38) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 39) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 40) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 41) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 42) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 43) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 44) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 45) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 46) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 47) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 48) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 49) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
	(package_stats (p_number 50) (status "nil") (pkg_pick_time 0) (pkg_del_time 0) (pkg_wait_time 0) (pkg_late_time 0) (on_time_delivery "Yes"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deftemplate truck_stats "Truck Statistics"			;;Truck statistics;;
	(slot t_number) (slot start_time) (slot wait_time) (slot busy_time) (slot loaded_travel_time) (slot empty_travel_time) (slot package_delivered) (slot total_load)
)

(deffacts truck_statistics
	(truck_stats (t_number 7)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 6)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 5)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 4)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 3)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 2)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
	(truck_stats (t_number 1)  (start_time 0) (wait_time 0) (busy_time 0.001) (loaded_travel_time 0) (empty_travel_time 0) (package_delivered 0.001) (total_load 0))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate pkg_avg								;;Average package report template;;
	(slot tot_wait_time) (slot num_late_pkg) (slot tot_late_time)
)

(deffacts all_package_details
	(pkg_avg (tot_wait_time 0.0001) (num_late_pkg 0) (tot_late_time 0.0001))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts total_numbers
	(total_trucks 7)
	(total_packages 50)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts end_calibration_for_truck
	(end_calibration_trucks 1)
	(end_calibration_trucks 2)
	(end_calibration_trucks 3)
	(end_calibration_trucks 4)
	(end_calibration_trucks 5)
	(end_calibration_trucks 6)
	(end_calibration_trucks 7)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate city_link "Links of cities"
	(slot city1) (slot city2) (slot cost)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts clock_fact			                         ;;Universal clock;;
	(clock 0)
)
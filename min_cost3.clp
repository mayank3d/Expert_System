(defrule Rule3.1_min_cost "Finding min cost"			;; floyed algorithm for min cost
	(declare (salience 1))
	(city_name (city ?var1))	;k
	(city_name (city ?var2))	;i
	(city_name (city ?var3))	;j
	?c1 <- (city_link (city1 ?var2) (city2 ?var3) (cost ?cst1))	;ij
	?c2 <- (city_link (city1 ?var2) (city2 ?var1) (cost ?cst2))	;ik
	?c3 <- (city_link (city1 ?var1) (city2 ?var3) (cost ?cst3))	;kj
	=>
	(if(> ?cst1 (+ ?cst2 ?cst3))
	then (modify ?c1(cost (+ ?cst2 ?cst3))) )
)
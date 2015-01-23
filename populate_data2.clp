(defrule Rule2.1	"Set zero cost with self"								;; Zero distance link with self for each city
	(declare (salience 2))
	(city_name (city ?var))
	=>
	(assert (city_link (city1 ?var) (city2 ?var) (cost 0)))
)

(defrule Rule2.2	"infinite cost to others"								;; Each city to every other city infinite distance
	(declare (salience 2))
	(city_name (city ?var1))
	(city_name (city ?var2))
	(test (neq ?var1 ?var2))
	=>
    (assert (city_link (city1 ?var1) (city2 ?var2) (cost 99999))) 
)

(defrule Rule2.3	"Add edge distance"
	(declare (salience 2))
	?ct_edg <- (city_edge (cityA ?var1) (cityB ?var2) (dist ?var3))
	?ct_lnk <- (city_link (city1 ?var1) (city2 ?var2))
	=>
	(retract ?ct_edg)
	(modify ?ct_lnk (cost ?var3))
)

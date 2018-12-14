(defrule startup
    =>
    (printout t "The problem is " crlf)
    (printout t "  + HOCUS " crlf)
    (printout t "    POCUS " crlf)
    (printout t "    ---- " crlf)
    (printout t "  = PRESTO" crlf crlf)
    (assert (number 0)
        (number 1)(number 2)(number 3)(number 4)
        (number 5)(number 6)(number 7)(number 8)
        (number 9)(letter H)(letter O)(letter C)
        (letter U)(letter S)(letter P)(letter R)
        (letter E)(letter T)
    )
)

(deftemplate combination (slot letter (type SYMBOL)) (slot number (type INTEGER)))
(defrule generate-combinations
    (number ?x)
    (letter ?a)
    =>
    (assert (combination (letter ?a)(number ?x)))
)

(defrule find-solution
    (combination (letter H)(number ?h & :(= 9 ?h)))
    (combination (letter P)(number ?p & :(= 1 ?p)))
    (combination (letter C)(number ?c & :(= 2 ?c)))
    (combination (letter R)(number ?r & :(= 1 ?r)))
    (combination (letter U)(number ?u))
    (combination (letter S)(number ?s & :(= (+ ?c ?c) ?s)))
    (combination (letter O)(number ?o & :(= (+ ?s ?s) ?o)))
    (combination (letter T)(number ?t & :(= (+ ?u ?u ) ?t)))
    (combination (letter E)(number ?e & :(= (mod (+ ?o ?o) 10) ?e)))
    
    =>
    (printout t "A solution is:" crlf)
    (printout t crlf)
    (printout t " + "  ?h ?o ?c ?u ?s crlf)
    (printout t "   "  ?p ?o ?c ?u ?s crlf)
    (printout t "   " "------" crlf)
    (printout t " = "?p ?r ?e ?s ?t ?o crlf)
    
)

(reset)
(run)
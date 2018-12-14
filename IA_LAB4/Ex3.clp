(defrule startup
    =>
    (printout t "The problem is " crlf)
    (printout t "  + TWO " crlf)
    (printout t "    TWO " crlf)
    (printout t "    --- " crlf)
    (printout t "  = FOUR" crlf crlf)
    (assert (number 0)
        (number 1)(number 2)(number 3)(number 4)
        (number 5)(number 6)(number 7)(number 8)
        (number 9)(letter T)(letter W)(letter O)
        (letter F)(letter U)(letter R)
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
    (combination (letter T)(number ?t & :(= 5 ?t)))
    (combination (letter F)(number ?f & :(= 1 ?f)))
    (combination (letter O)(number ?o & :(= 0 ?o)))
    (combination (letter R)(number ?r & :(= 0 ?r)))
    (combination (letter W)(number ?w & ~?t & ~?f))
    (combination (letter U)(number ?u & ~?t & ~?f & :(= (mod (+ ?w ?w) 10 ) ?u) & :( < (+ ?w ?w) 9)))
    =>
    (printout t "A solution is:" crlf)
    (printout t " T = " ?t)
    (printout t " F = " ?f)
    (printout t " O = " ?o)
    (printout t " R = " ?r)
    (printout t " W = " ?w)
    (printout t " U = " ?u)
    (printout t crlf)
    (printout t " + " ?t ?w ?o crlf)
    (printout t "   " ?t ?w ?o crlf)
    (printout t "   " "----"   crlf)
    (printout t " = " ?f ?o ?u ?r crlf)
    
)

(reset)
(run)
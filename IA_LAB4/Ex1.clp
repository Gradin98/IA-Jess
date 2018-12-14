;VARIANTA 1
(deffunction calculMaxim ($?lista)
    (bind ?maxVal (nth$ 1 ?lista))
    (foreach ?n ?lista
    	(if (> ?n ?maxVal) then (bind ?maxVal ?n))
    )
    (return ?maxVal)
)

(printout t "v1 " (calculMaxim 4 6 1 3 2 5 6 7) crlf)
(printout t "v2 " (max 4 5 6 1 2 1 5 6) crlf)



;VARIANTA 2 - Cu ajutorul unei reguli
;Aceasta varianta presupune ca numerele sunt introduse sub forma de fapte,
;pentru fiecare numar insedandu-se cate un fapt in baza de cunostinte

(deftemplate nr (slot n))
(deftemplate max (slot n))

(assert (nr (n 5)))
(assert (nr (n 3)))
(assert (nr (n 7)))
(assert (nr (n 2)))
(assert (nr (n 9)))
(assert (nr (n 0)))
(assert (max (n -1)))

(defrule max
    (declare (salience 2))
    ?nr <- (nr (n ?x))
    ?max <- (max (n ?m))
    (test (> ?x ?m))
    =>
    (modify ?max (n ?x))
    (retract ?nr)
)

(defrule print
    (declare (salience 1))
    (max (n ?max))
    =>
    (printout t "v3 " ?max crlf)
)

(run)
;Varianta 3 - Pentru liste

(deftemplate lista (multislot elemente))
(deftemplate max1 (slot m))
(deffacts initial
    (max1 (m 0))
    (lista (elemente 1 2 6 3 5 3))
)

(reset)
(defrule maxim
    (lista (elemente $? ?u&:(integerp ?u) $?))
    ?idMax <- (max1 (m ?max&:(> ?u ?max)))
    =>
    (modify ?idMax (m ?u))
)

(defrule print1
    (declare (salience -1))
    (max1 (m ?max))
    =>
    (printout t "v4 " ?max crlf)
)

(run) 

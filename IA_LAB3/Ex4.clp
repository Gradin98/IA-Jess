(deftemplate Aparat(slot valoare))

(assert (Aparat(valoare 0)))

(deffunction citeste()
    (printout t "Adauga moneda de 25 / 5 bani" crlf)
    (bind ?r (read))
    (if(= ?r 5) then
    	(return ?r)
    elif(= ?r 25) then
        (return ?r)
    else
        (printout t "Ati introdus o valoare gresita! Introduceti 25 sau 5 bani" crlf)
        (citeste)
    )
)

(deffunction adauga(?r)
    (bind ?x (citeste))
    (printout t "Buget Total " (+ ?r ?x) crlf)
    (assert (Aparat(valoare(+ ?r ?x))))
)

(defrule adaugaBani
    ?x <- (Aparat (valoare ?p & :(< ?p 50)))
    =>
    (adauga ?p )
    (retract ?x)
)

(defrule final
    (Aparat (valoare ?x & :(>= ?x 50)))
    =>
	(printout t "Success")
)

(run)

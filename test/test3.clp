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

(defrule r1
    (Aparat (valoare 10))
    =>
    (adauga 10 )
)

(defrule r2
    (Aparat (valoare 15))
    =>
    (adauga 15 )
)

(defrule r0
    (Aparat (valoare 0))
    =>
    (adauga 0 )
)

(defrule r4
    (Aparat (valoare 5))
    =>
    (adauga 5 )
)

(defrule r6
    (Aparat (valoare 20))
    =>
    (adauga 20)
)

(defrule r7
    (Aparat (valoare 25))
    =>
    (adauga 25)
)

(defrule r8
    (Aparat (valoare 30))
    =>
    (adauga 30)
)

(defrule r9
    (Aparat (valoare 35))
    =>
    (adauga 35)
)

(defrule r10
    (Aparat (valoare 40))
    =>
    (adauga 40)
)

(defrule r11
    (Aparat (valoare 45))
    =>
    (adauga 45)
)

(defrule r12
    (Aparat (valoare 50))
    =>
    (adauga 50)
)

(defrule final
    (Aparat (valoare ?x & :(>= ?x 50)))
    =>
	(printout t "Success")
)

(run)
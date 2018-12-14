(deftemplate Intrebare (slot intrebare)(slot raspuns))

(assert (Intrebare (intrebare nil)(raspuns nil)))

(defrule r1
    (Intrebare (intrebare nil)(raspuns nil))
    =>
    (printout t "It is very big?(yes/no)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "It is very big?")(raspuns ?r)))
)

(defrule r2.1
    (Intrebare (intrebare "It is very big?")(raspuns yes))
    =>
    (printout t "Does it have a long neck?(yes/no)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "Does it have a long neck?")(raspuns ?r)))
)

(defrule r2.2
    (Intrebare (intrebare "It is very big?")(raspuns no))
    =>
    (printout t "Does it have squeak?(yes/no)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "Does it have squeak?")(raspuns ?r)))
)

(defrule r3.1.1
    (Intrebare (intrebare "Does it have squeak?")(raspuns no))
    =>
    (printout t "Guess squirrel" crlf)
)

(defrule r3.1.2
    (Intrebare (intrebare "Does it have squeak?")(raspuns yes))
    =>
    (printout t "Guess mouse" crlf)
)

(defrule r3.2.1
    (Intrebare (intrebare "Does it have a long neck?")(raspuns no))
    =>
    (printout t "Does it have a trunk?(yes/no)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "Does it have a trunk?")(raspuns ?r)))
)

(defrule r3.2.2
    (Intrebare (intrebare "Does it have a long neck?")(raspuns yes))
    =>
    (printout t "Guess giraffe" crlf)
)

(defrule r4.1.1
    (Intrebare (intrebare "Does it have a trunk?")(raspuns no))
    =>
    (printout t "Does it like to be in water?(yes/no)" crlf)
    (bind ?r (read))
    (assert (Intrebare (intrebare "Does it like to be in water?")(raspuns ?r)))
)

(defrule r4.1.2
    (Intrebare (intrebare "Does it have a trunk?")(raspuns yes))
    =>
    (printout t "Guess elephant" crlf)
)

(defrule r5.1.1
    (Intrebare (intrebare "Does it like to be in water?")(raspuns no))
    =>
    (printout t "Guess rhino" crlf)
)

(defrule r5.1.2
    (Intrebare (intrebare "Does it like to be in water?")(raspuns yes))
    =>
    (printout t "Guess hippo" crlf)
)

(run)




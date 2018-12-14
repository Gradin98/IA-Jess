(deftemplate number(slot value))
(assert (number (value 1)))
(assert (number (value 2)))
(assert (number (value 3)))

(defrule some-rule
    ?fact1 <- (number (value ?n1))
    ?fact2 <- (number (value ?n2))
    ?fact3 <- (number (value ?n3))
    (test (neq ?fact1 ?fact2 ?fact3))
    (test (neq ?n1 ?n2))
    (test (neq ?n3 ?n2))
    (test (neq ?n1 ?n3))
    =>
    (printout t ?fact1.value ?fact2.value ?fact3.value crlf)
)
(run)

(deffacts data (set a b c d e f g h i j)(combination_length 10))
(reset)

(defrule initializare_combination (set $? ?x $?) => (assert (combination ?x)))
(defrule extend_combination 
    (combination_length ?k)
    (combination $?x & :(< (length$ $?x) ?k))
    (set $? ?e & :(not (member$ ?e $?x)) $?)
    =>
    (assert (combination ?e $?x))
)

(defrule print
    (combination_length ?k)
    (combination $?x & :(= (length$ $?x) ?k))
    =>
    (printout t $?x crlf)
)

(run)

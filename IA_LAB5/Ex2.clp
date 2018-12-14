(deftemplate goal
    (slot move)
    (slot on-top-of)
)

(deffacts initial-data
    (stack A B C D)
    (stack E F G)
    (goal (move C)(on-top-of G))
)

(reset)

(deffunction print-moved-message(?A ?B)
    (printout t ?A " moved on top of " ?B "." crlf)
)

;Operatii de baza
(defrule push-value
    ?push-value <- (push-value ?value)
    ?stack <- (stack $?rest)
    =>
    (retract ?push-value ?stack)
    (assert (stack ?value ?rest))
    (printout t "Pushing value " ?value crlf)
)

(defrule pop-value-valid
    ?pop-value <- (pop-value)
    ?stack <- (stack ?value $?rest)
    =>
    (retract ?pop-value ?stack)
    (assert (stack ?rest))
    (printout t "Popped value " ?value " " $?rest crlf)
)

(defrule pop-value-invalid
    ?pop-value <- (pop-value)
    (stack)
    =>
    (retract ?pop-value)
    (printout t "Popping from empty stack" crlf)
)

;Mutari
(defrule move-directly
    ?goal <- (goal (move ?block1)(on-top-of ?block2))
    ?stack1 <- (stack ?block1 $?rest1)
    ?stack2 <- (stack ?block2 $?rest2)
    =>
    (retract ?goal ?stack1 ?stack2)
    (assert (stack ?rest1))
    (assert (stack ?block1 ?block2 ?rest2))
    (print-moved-message ?block1 ?block2)
)

(defrule move-to-floor
    ?goal <- (goal (move ?block1)(on-top-of floor))
    ?stack1 <- (stack ?block1 $?rest)
    =>
    (retract ?goal ?stack1)
    (assert (stack $?block1))
    (assert (stack $?rest))
    (print-moved-message ?block1 "floor")
)

(defrule clear-upper-block
    (goal (move ?block1))
    (stack ?top $?X ?block1 $?Y)
    =>
    (assert (goal (move ?top)(on-top-of floor)))
)

(defrule clear-lower-block
  	(goal (on-top-of ?block1))
    (stack ?top $?X ?block1 $?Y)
    =>
    (assert (goal (move ?top)(on-top-of floor)))  
)
(facts)
(run)

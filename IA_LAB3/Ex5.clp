(defglobal ?*TASK_PRIORITY_1* = 2)
(defglobal ?*TASK_PRIORITY_2* = 1)

(deftemplate relat (slot mode (type STRING)) (slot son (type STRING))(slot parent (type STRING)))

(assert (relat (mode "ako")(son "microcalculator")(parent "calculator")))
(assert (relat (mode "ako")(son "minicalculator")(parent "calculator")))
(assert (relat (mode "ako")(son "supercalculator")(parent "calculator")))
(assert (relat (mode "ako")(son "arduino")(parent "microcalculator")))
(assert (relat (mode "ako")(son "server")(parent "supercalculator")))
(assert (relat (mode "ako")(son "RPI")(parent "minicalculator")))
(assert (relat (mode "has")(son "Ram")(parent "arduino")))
(assert (relat (mode "has")(son "procesor")(parent "RPI")))
(assert (relat (mode "is-a")(son "sistem de calcul")(parent "minicalculator")))
(assert (relat (mode "is-a")(son "bani")(parent "server")))

(defrule cauta-solutie-is-a
    (declare (salience ?*TASK_PRIORITY_1*))
    (relat(son ?a))
    ?m <- (relat (mode "is-a")(son ?a)(parent ?q))
    ?n <- (relat (mode "ako")(son ?q)(parent ?p))
    =>
    (assert (relat (parent ?p)))
    (retract ?m ?n)
)

(defrule cauta-solutie
    (declare (salience ?*TASK_PRIORITY_1*))
    (relat(son ?a))
    ?v <- (relat (mode "ako")(son ?a)(parent ?p))
    =>
    (assert (relat(parent ?p)))
    (retract ?v)
)

(defrule parinte-de-parinte
    (declare (salience ?*TASK_PRIORITY_2*))
    (relat(parent ?p))
    ?v <- (relat (mode "ako")(son ?p)(parent ?q))
    =>
    (retract ?v)
    (assert (relat(parent ?q)))
)

(defrule printeaza-solutie
    (declare(salience -1000))
    ?n <- (relat(parent ?p))
    =>
    (printout t ?p crlf)
    (retract ?n)
)



(run)
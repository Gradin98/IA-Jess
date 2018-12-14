(defglobal ?*TASK_PRIORITY_1* = 2)
(defglobal ?*TASK_PRIORITY_2* = 1)

(deftemplate relat (slot mode (type STRING)) (slot son (type STRING))(slot parent (type STRING)))

(assert (relat (mode "ako")(son "ballon")(parent "aircraft")))
(assert (relat (mode "ako")(son "pr.driven")(parent "aircraft")))
(assert (relat (mode "ako")(son "jet")(parent "aircraft")))
(assert (relat (mode "ako")(son "blimp")(parent "ballon")))
(assert (relat (mode "ako")(son "blimp")(parent "pr.driven")))
(assert (relat (mode "ako")(son "special")(parent "pr.driven")))
(assert (relat (mode "ako")(son "dc-3")(parent "pr.driven")))
(assert (relat (mode "ako")(son "dc-9")(parent "jet")))
(assert (relat (mode "ako")(son "concorde")(parent "jet")))
(assert (relat (mode "has-shape")(son "ballon")(parent "round")))
(assert (relat (mode "has-shape")(son "blimp")(parent "ellips")))
(assert (relat (mode "is-a")(son "good year")(parent "blimp")))
(assert (relat (mode "is-a")(son "spirit of stl")(parent "special")))
(assert (relat (mode "is-a")(son "airforce 1")(parent "dc-9")))

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
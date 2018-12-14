(deftemplate masinaSpalat
    (slot apa(allowed-values TRUE FALSE))
    (slot electricitate(allowed-values TRUE FALSE))
    (slot detergent(allowed-values TRUE FALSE))
    (slot stare)
)

(assert (masinaSpalat (apa FALSE)(electricitate FALSE)(detergent FALSE)(stare init)))
(defrule alimentareEnergie
    ?id <- (masinaSpalat (stare init))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat(apa FALSE)(electricitate TRUE)(detergent FALSE)(stare cuElectricitate)))
    (printout t "Masina de spalat alimentata cu electricitate" crlf)
    (facts)
)

(defrule alimentareApa
    ?id <- (masinaSpalat (stare cuElectricitate))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat (apa TRUE)(electricitate TRUE)(detergent FALSE)(stare cuApaSiElectricitate)))
    (printout t "Masina de spalat alimentata cu apa si electricitate" crlf)
    (facts)
)

(defrule alimentareDetergent
    ?id <- (masinaSpalat (stare cuApaSiElectricitate))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat (apa TRUE)(electricitate TRUE)(detergent TRUE)(stare functionabila)))
    (printout t "Masina de spalat alimentata cu apa, electricitate si detergent" crlf)
    (facts)
)

(defrule prespalare
    ?id <- (masinaSpalat (stare functionabila))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat(apa TRUE)(electricitate TRUE)(detergent TRUE)(stare prespalare)))
    (printout t "Masina de spalat in prespalare" crlf)
    (facts)
)

(defrule spalare
    ?id <- (masinaSpalat (stare prespalare))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat(apa TRUE)(electricitate TRUE)(detergent TRUE)(stare spalare)))
    (printout t "Masina de spalat in spalare" crlf)
    (facts)
)


(defrule stoarcere
    ?id <- (masinaSpalat (stare spalare))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat(apa TRUE)(electricitate TRUE)(detergent TRUE)(stare stoarcere)))
    (printout t "Masina de spalat in stoarcere" crlf)
    (facts)
)

(defrule finalizareCiclu
    ?id <- (masinaSpalat (stare stoarcere))
    =>
    (facts)
    (retract ?id)
    (assert (masinaSpalat(apa TRUE)(electricitate TRUE)(detergent TRUE)(stare FINALA)))
    (printout t "Masina de spalat este gata")
    (facts)
)

(run)
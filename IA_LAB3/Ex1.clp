(deftemplate persoana(multislot nume)(slot ochi)(slot par)(slot nationalitate))

(assert (persoana (nume Ion Ionescu)(ochi verzi)(par saten)(nationalitate franceza)))
(assert (persoana (nume Bogdan Popescu)(ochi caprui)(par blond)(nationalitate germana)))
(assert (persoana (nume Ionel Romanu)(ochi albastri)(par blond)(nationalitate germana)))
(assert (persoana (nume Cristi Ardelean)(ochi verzi)(par blond)(nationalitate germana)))
(assert (persoana (nume Mihai Popescu)(ochi purpurii)(par castaniu)(nationalitate romana)))

(defrule rule1
    (persoana (nume $? ?prenume ?nume)(ochi verzi)(par saten)(nationalitate franceza))
    =>
    (printout t "Regula 1 -> Nume: " ?nume " Prenume " ?prenume crlf)
)

(defrule rule2
    (persoana (nume $? ?n ?pn)(ochi ?o & ~albastri)(par ?p & ~negru)(nationalitate ?nt))
    (not (persoana(nume ?nn & ~?n ?pnn & ~?pn)(ochi ?o)))
    (not (persoana(nume ?nnn & ~?n ?pnnn & ~?pn)(par ?p)))
    =>
    (printout t "Regula 2 -> Nume: " ?pn " Prenume: " ?n crlf)
)

(defrule rule3
    (persoana (nume $? ?nume1 ?prenume1)(ochi ?ochi1)(par ?par1 & ~blond)(nationalitate ?nt))
    (test (or (eq ?par1 saten)(eq ?ochi1 albastri)))
    (persoana (nume $? ?nume2 ?prenume2)(ochi ?ochi2 & verzi)(par ?par2 & ?par1)(nationalitate ?nt1))
    (test (or (eq ?par1 saten)(not (eq ?ochi2 caprui))))
    =>
    (printout t "Regula 3 -> " crlf)
    (printout t "Persoana 1 : " ?nume1 " " ?prenume1 " ochi " ?ochi1 " par " ?par1 " nationalitate " ?nt crlf)
    (printout t "Persoana 2 : " ?nume2 " " ?prenume2 " ochi " ?ochi2 " par " ?par2 " nationalitate " ?nt1 crlf)
)

(run)


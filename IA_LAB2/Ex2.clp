(deftemplate zbor
    (slot plecare)
    (slot aterizare)
    (slot distanta (type INTEGER))
)

(assert (zbor(plecare NEW)(aterizare BANGLADES)(distanta 1000)))
(assert (zbor(plecare NEW)(aterizare TIMISOARA)(distanta 2042)))
(assert (zbor(plecare TIMISOARA)(aterizare NEWORK)(distanta 2042)))
(assert (zbor(plecare NEW )(aterizare LONDRA)(distanta 1538)))
(assert (zbor(plecare PARIS)(aterizare BANGLADES)(distanta 8932)))
(assert (zbor(plecare NEW )(aterizare PARIS)(distanta 8532)))
(assert (zbor(plecare LONDRA)(aterizare BANGLADES)(distanta 752)))
(assert (zbor(plecare BUCURESTI)(aterizare PARIS)(distanta 5263)))
(assert (zbor(plecare BERLIN)(aterizare MADRID)(distanta 7458)))
(assert (zbor(plecare NEW )(aterizare BANGLADES)(distanta 5267)))

(defrule zboruriNewYork
    (zbor (plecare NEW)(aterizare ?aterizare)(distanta ?distanta & :(> ?distanta 1000)))
    =>
    (printout t "Plecare: New York Ateizare: " $?aterizare " distanta: " ?distanta crlf)
)

(defrule zboruriNewYorkDistanta
    (zbor (plecare ?plecare)(aterizare ?aterizare)(distanta ?distanta))
    =>
    (if(and(= ?plecare NEW)(>= ?distanta 800)(<= ?distanta 2200)) then
        (printout t "Plecare: " ?plecare " Ateizare: " $?aterizare " distanta: " ?distanta crlf)
    )
)

(run)

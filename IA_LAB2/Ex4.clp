(deftemplate note
    (slot matematica (type INTEGER))
    (slot informatica (type INTEGER))
    (slot fizica (type INTEGER))
    (slot chimie (type INTEGER))
    (slot limbaRomana (type INTEGER))
    (slot limbaEngleza (type INTEGER))
    (slot limbaGermana (type INTEGER))
    (slot economie (type INTEGER))
    (slot psihologie (type INTEGER))
)

(assert (note (matematica 0)(informatica 0)(fizica 0)(chimie 0)
        (limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0))
)

(defrule citeste
    ?id<-(note (matematica 0)(informatica 0)(fizica 0)(chimie 0)
        (limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0))
    =>
    (printout t "Notele elevului: " crlf)
    (printout t "-matematica: ")
    (bind ?m (read))
    (printout t "-informatica: ")
    (bind ?i (read))
    (printout t "-fizica: ")
    (bind ?f (read))
    (printout t "-chimie: ")
    (bind ?c (read))
    (printout t "-limba romana: ")
    (bind ?r (read))
    (printout t "-limba engleza: ")
    (bind ?e (read))
    (printout t "-limba germana: ")
    (bind ?g (read))
    (printout t "-economie: ")
    (bind ?ec (read))
    (printout t "-psihologie: ")
    (bind ?ps (read))
    (retract ?id)
    (assert (note (matematica ?m)(informatica ?i)(fizica ?f)(chimie ?c)(limbaRomana ?r)(limbaEngleza ?e)(limbaGermana ?g)
            (economie ?ec)(psihologie ?ps)))
)

(defrule facultateMateInfo
    
    (note (matematica ?m & :(>= ?m 8))(informatica ?i & :(>= ?i 8))(fizica ?f & :(>= ?f 8)))
    =>
    (printout t "Elevul poate intra la mate info " crlf)
)

(defrule facultateEconomie
    (note (economie ?ec & :(>= ?ec 8))(matematica ?m & :(>= ?m 8)))
    =>
    (printout t "Elevul poate intra la economie" crlf)
)

(defrule facultateLitere
    (note (limbaEngleza ?e & :(>= ?e 8))(limbaGermana ?g & :(>= 8))(limbaRomana ?r & :(>= 8)))
    =>
    (printout t "Elevul poate intra la litere" crlf)
)



(run)



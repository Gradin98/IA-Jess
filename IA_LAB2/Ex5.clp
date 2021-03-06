(deftemplate vreme
    ( slot data (TYPE STRING))
    ( slot nori (TYPE STRING))
    ( slot vant (TYPE STRING))
    ( slot vizualizare (TYPE STRING))
    ( slot precipicatii (TYPE STRING))
)

(assert (vreme (data "24 februarie")(nori "cirrocumlus")(vant "nord-est - sud")(vizualizare nil)(precipicatii "senin")))
(assert (vreme (data "10 martie")(nori "stratocumulus")(vant "nord-est - sud")(vizualizare nil)(precipicatii "ceata")))
(assert (vreme (data "14 aprilie")(nori "cumulonimbus")(vant "est - sud")(vizualizare "noaptea")(precipicatii "senin")))
(assert (vreme (data "20 august")(nori "altostratus")(vant "nord-est - vest")(vizualizare "ziua")(precipicatii "senin")))
(assert (vreme (data "30 septembrie")(nori "altocumulus")(vant "vest - sud")(vizualizare nil)(precipicatii "ploaie")))

(defrule cautavremea
    (vreme (data ?data)(nori ?nori)(vant ?vant)(precipicatii ?precipitatii)(vizualizare ?vizualizare))
    =>
    (printout t "VREMEA: " ?data crlf)
	(if(and 
        (str-index "cirrocumlus" ?nori)
        (str-index "nord-est" ?vant)
        (str-index "sud" ?vant)) then
    		(printout t "Ploaie" crlf)
    	)
    (if(and 
        (str-index "altostratus" ?nori)
        (str-index "vest" ?vant)
        (str-index "sud" ?vant)) then
    		(printout t "Ninsoare" crlf)
    	)
    (if(and 
        (str-index "altocumulus" ?nori)
        (str-index "nord-est" ?vant)
        (str-index "sud" ?vant)) then
    		(printout t "Ploaie" crlf)
    	)
    (if(str-index "ceata" ?precipitatii) then
        (printout t "Cald" crlf)
        )
    (printout t "senin" crlf)
    (printout t crlf)
)

(run)
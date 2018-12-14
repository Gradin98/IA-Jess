;Scrieti un program JESS care sa indice ce tip de vin sa fie servit in functie de meniul
;ales. De exemplu, pentru o friptura de vita în sange se recomanda un vin rosu semi-
;dulce. Studiati ce vinuri sunt recomandate pentru anumite tipuri de mancare. Dupa
;documentarea privind recomandarile de vinuri realizati ̧sabloanele necesare, introduceti
;faptele cerute si construiti una sau mai multe reguli pentru a realiza un sistem software
;de recomandare de vin. Vinuri simple pentru mancaruri complicate. Vinuri complexe
;pentru mancaruri simple.Nu se serveste un vin dulceag intre doua vinuri (albe sau rosii)
;seci. Vinurile albe seci se dau inaintea celor rosii. Vinurile albe foarte dulci se servesc,
;in schimb, dupa cele rosii. Ordinea este intotdeauna crescatoare: mai intai vinurile slabe,
;apoi cele tari; mai intai vinul nou, apoi cel vechi. Vinurile tip sampanie sau spumante
;pot fi servite dupa sau inaintea celor nespumante, dar nu intre ele. Spre finele pranzului
;se recomanda de servit un vin rosu. Sunt deasemenea recomandabile si vinurile
;licoroase. Vinurile seci albe si rosii pot fi servite pe intreg parcursul pranzului, dar e
;mai bine de servit toata gama vinurilor.

(deftemplate meniu
    (slot mancare)
    (slot perioada)
)

(assert(meniu(mancare "friptura de vita")(perioada "pranz")))
(assert(meniu(mancare "supa")(perioada "pranz")))
(assert(meniu(mancare "peste")(perioada "pranz")))
(assert(meniu(mancare "porc")(perioada "pranz")))

(defrule recomandare
    (meniu (mancare ?mancare)(perioada ?perioada))
    =>
    (if(and (str-index "vita" ?mancare)(str-index "pranz" ?perioada)) then
        (printout t "Pentru " ?mancare " se recomanda Vin rosu" crlf)
    )
    (if(and (str-index "supa" ?mancare)(str-index "seara" ?perioada)) then
        (printout t "Pentru " ?mancare " se recomanda Vin alb" crlf)
    )
    (if(and (str-index "peste" ?mancare)(str-index "pranz" ?perioada)) then
        (printout t "Pentru " ?mancare " se recomanda Vin rosu" crlf)
    )
    (if(and (str-index "porc" ?mancare)(str-index "pranz" ?perioada)) then
        (printout t "Pentru " ?mancare " se recomanda Vin alb" crlf)
    )
    
)

(run)
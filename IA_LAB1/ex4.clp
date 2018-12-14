(deftemplate animal
    (slot mod_viata)
    (slot mediu_de_viata)
    (slot reproducere)
    (slot culoare)
    (slot nume)
    (slot mancare)
    (multislot consumator)
    (multislot animal)
)

(assert (animal(mod_viata acvatic)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume purcel)(mancare frunze)(consumator rechin)
        (animal peste)))
(assert (animal(mod_viata acvatic)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume gigel)(mancare frunze)(consumator vulpe)
        (animal gaina)))
(assert (animal(mod_viata mediteranian)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume patrunjel)(mancare frunze)(consumator caine)
        (animal pisica)))
(assert (animal(mod_viata nisip)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume gigel)(mancare peste)(consumator soarece de casa)
        (animal branza)))
(assert (animal(mod_viata tufis)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume gigel)(mancare curcubeu)(consumator paduche de par)
        (animal om)))
(assert (animal(mod_viata polar)(mediu_de_viata apa)(reproducere ou)
        (culoare verde)(nume gigel)(mancare curcubeu)(consumator paduche de par)
        (animal ursulet)))


(deffunction nume($?x)
    (return ?x)
)

(defrule mod_de_viata_afisare
    (animal(nume ?nume)(mod_viata ?mod_de_viata))
    =>
    (if (= ?mod_de_viata acvatic) then
        (printout t (nume ) crlf)
    )
)


(defrule regim_alimentar_mod_de_viata_afisare
    (animal(nume ?nume)(mod_viata ?mod_de_viata)(mancare ?mancare))
    =>
    (if (and (= ?mod_de_viata mediteranian) (= ?mancare frunze))  then
        (printout t "regim alimentar mediteranian: " ?nume crlf)
    )
)

(defrule pradator_animal
    (animal(animal ?animal)(consumator ?consumator))
    =>
    (printout t ?animal " - " ?consumator crlf)
    (printout t ?consumator " - " ?animal crlf)
)

(defrule consumat_animal
    (animal(animal ?animal)(consumator ?consumator))
    =>
    (printout t ?consumator " - " ?animal crlf)
)

(defrule zona_polara
    (animal (mod_viata ?mod_viata)(animal ?animal)(nume ?nume))
    =>
    (if(= ?mod_viata polar) then
        (printout t "zona polara: " ?animal " nume: " ?nume crlf)
    )
)

(run)
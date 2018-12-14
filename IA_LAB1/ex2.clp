(deftemplate multime
    (slot nume)
    (multislot elemente)
    (multislot regula)
    (slot incluziune)
)

(assert (multime(nume A)(elemente 1 2 3 4 5)(regula > 2)(incluziune C)))
(assert (multime(nume B)(elemente culoare1 culoare2 culoare3)(regula nil)(incluziune nil)))
(assert (multime(nume C)(elemente )(regula > 0)(incluziune nil)))

(defrule afisare
    (multime(nume ?nume)(elemente $?elemente)(regula $?regula)(incluziune ?incluziune))
    =>
    (if (neq (length$ ?elemente) 0) then
        (if (neq (length$ ?regula) 0) then
            
			(printout t ?nume " => " $?elemente crlf)
    
)))

(run)

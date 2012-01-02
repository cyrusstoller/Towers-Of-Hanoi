;; Towers of Hanoi Solution
;; Written in our grandmother's living room
;;
;; To use this program type: (hanoi N)
;; where N is the number of discs
;;
;; To see only the number of moves type: (silent-hanoi N)
;; where N is the number of discs
;;
;; Written by Cyrus Stoller to teach my brother the basics of LISP programming


(defvar *num_steps* 0)

(defun towersofhanoihelper(n destination origin remaining verbose)
	(if (> n 0)
		(progn 
			(towersofhanoihelper (- n 1) remaining origin destination verbose)
			(format verbose "Move disc ~D: ~D --> ~D~&" n origin destination)
			(setf *num_steps* (+ *num_steps* 1))
			(towersofhanoihelper (- n 1) destination remaining origin verbose)
		)
	)
)

(defun towersofhanoi (n verbose)
	(setf *num_steps* 0)
	(towersofhanoihelper n 3 1 2 verbose)
	(format t "Number of moves taken: ~D~&" *num_steps*)
)

(defun hanoi (n)
	(towersofhanoi n t)
)

(defun silent-hanoi (n)
	(towersofhanoi n nil)
)
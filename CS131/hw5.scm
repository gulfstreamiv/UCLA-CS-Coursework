#lang racket


(define match-junk
  (lambda (k frag go-back-point)
    (or 
     ; always try match nothing first, since junk basically matches anything
     (call/cc 
		(lambda (continue-here) ;create continuation here
			(cons frag (lambda () (continue-here #f))))) 
     ; if match nothing fails, continue match 1, then call recursively
     (and (or (< 0 k) (go-back-point))
		  (or (pair? frag) (go-back-point))
		  (match-junk (- k 1) (cdr frag) go-back-point)
	  ))))

(define match-*
  (lambda (matcher frag go-back-point)
    (or
     ; First try match nothing, if fails program will backtrack
     (call/cc (lambda (continue-here)
		(cons frag (lambda () (continue-here #f)))))
     ; if match nothing (zero) fails, go back and continue with one  
	 ; and recursively more
     (let ((return-struct (matcher frag go-back-point)))
       (match-* matcher (car return-struct) (cdr return-struct))))))

(define cc-based-make-matcher
  (lambda (pat)
    (cond
     
     ((symbol? pat)  ;case symbol
      
	  (lambda (frag go-back-point)
	(and (or (pair? frag) (go-back-point))
	     (or (eq? pat (car frag)) (go-back-point))
	     (cons (cdr frag) go-back-point))))

     ((eq? 'or (car pat)) ;case or matcher 
      
	  (let make-or-matcher ((pats (cdr pat)))
	(if (null? pats)
	    (lambda (frag go-back-point) (go-back-point))
	    (let ((head-matcher (cc-based-make-matcher (car pats)))
		  (tail-matcher (make-or-matcher (cdr pats))))
	      (lambda (frag go-back-point)
			(or 
				(call/cc (lambda (continue-here)
					(head-matcher frag (lambda () (continue-here #f)))))
				(tail-matcher frag go-back-point)))))))
     
     ((eq? 'list (car pat)) ;case list matcher
      
	  (let make-list-matcher ((pats (cdr pat)))
	(if (null? pats)
	    (lambda (frag go-back-point) (cons frag go-back-point))
	    (let ((head-matcher (cc-based-make-matcher (car pats)))
		  (tail-matcher (make-list-matcher (cdr pats))))
	      (lambda (frag go-back-point)
		(let ((return-struct (head-matcher frag go-back-point)))
		  (tail-matcher (car return-struct) (cdr return-struct))))))))
     
     ((eq? 'junk (car pat)) ;case junk matcher
      
	  (let ((k (cadr pat)))
	(lambda (frag go-back-point)
	  (match-junk k frag go-back-point))))
     
     ((eq? '* (car pat)) ;case star matcher
      
	  (let ((matcher (cc-based-make-matcher (cadr pat))))
	(lambda (frag go-back-point)
	  (match-* matcher frag go-back-point)))))))

(define make-matcher
  (lambda (pat)
    (let ((matcher (cc-based-make-matcher pat)))
      (lambda (frag)
	    ; first level continuation point
		(call/cc (lambda (continue-here)
		    (matcher frag (lambda () (continue-here #f)))))))))
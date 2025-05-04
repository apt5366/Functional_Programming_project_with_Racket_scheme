#lang racket

; Answer 1
;global association list
(define al '())
;Ackermann function
(define (ackermann m n)
  (cond [(= m 0) (+ n 1)]
        [(and (> m 0) (= n 0)) (ackermann (- m 1) 1)]
        [(and (> m 0) (> n 0)) (ackermann (- m 1) (ackermann m (- n 1)))]
))
;test for inputs 1 and 2
(display "tests for number 1: \n")
(ackermann 1 2)
;bind function: returns a new association list, which is the result of
;adding a new entry (k,v) to the beginning of association list al.
(define (bind k v al)
  (cons (list k v) al)
)
;lookup function: returns the value for key k in al if there is
;an entry for k and returns #f otherwise.
(define (lookup k al)
  (cond [(null? al) #f]
        [(equal? k (caar al)) (car al)]
        [else (lookup k (cdr al))]
))

;ackermann_mem function
(define (ackermann_mem m n)
  (define value (ackermann m n))
  (define key (list m n))
  (cond [(not (lookup key al)) (begin
                                 (set! al (bind key value al))
                                 value)]
        [else (begin
                (display "memoization hit \n")
                value)]
))
;test for inputs 1 and 2
(ackermann_mem 1 2);adds to empty list
(ackermann_mem 1 2);hit



; Answer 2
;construct_mem function: performs automatic memoization. It takes an input function with two
;arguments and returns a function that is the memoized version of the
;input function.
(define (construct_mem f)
  (let ((al '()))
    (lambda (m n)
      (define value (f m n))
      (define key (list m n))
      (cond [(not (lookup key al)) (begin (set! al (bind key value al)) value) ]
            [else (begin
                (display "memoization hit \n")
                value)])))
)
;test 2
(display "\n\ntests for number 2: \n")
(define ackermannm (construct_mem ackermann))
(ackermannm 2 1)
(ackermannm 1 1)
(ackermannm 2 1)
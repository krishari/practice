;;;; SICP, Chapter 1.

;;; *Exercise 1.1:* Below is a sequence of expressions.  What is the result
;;; printed by the interpreter in response to each expression?  Assume that the
;;; sequence is to be evaluated in the order in which it is presented.

;;;      10
;; 10
;;;      (+ 5 3 4)
;; 12
;;;      (- 9 1)
;; 8
;;;      (/ 6 2)
;; 3
;;;      (+ (* 2 4) (- 4 6))
;; 6
;;;      (define a 3)
;; a
;;;      (define b (+ a 1))
;; b
;;;      (+ a b (* a b))
;; 19
;;;      (= a b)
;; #f
;;;      (if (and (> b a) (< b (* a b)))
;;;          b
;;;          a)
;; 4
;;;      (cond ((= a 4) 6)
;;;            ((= b 4) (+ 6 7 a))
;;;            (else 25))
;; 16
;;;      (+ 2 (if (> b a) b a))
;; 6
;;;      (* (cond ((> a b) a)
;;;               ((< a b) b)
;;;               (else -1))
;;;         (+ a 1))
;; 16

;;; *Exercise 1.2:* Translate the following expression into prefix form.

;;;      5 + 4 + (2 - (3 - (6 + 4/5)))
;;;      -----------------------------
;;;             3(6 - 2)(2 - 7)

(/ (+ 5 (+ 4 (- 2 (- 3 (+ 6 (/ 4 5))))))
   (* 3 (- 6 2) (- 2 7)))

;;; *Exercise 1.3:* Define a procedure that takes three numbers as arguments
;;; and returns the sum of the squares of the two larger numbers.

;; Non-helper function version.
(define (ex-1.3a x y z)
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
        ((and (< y x) (< y z)) (+ (* x x) (* z z)))
        (else (+ (* x x) (* y y)))))
;; My preferred solution.
(define (ex-1.3b a b c)
  (define (square x) (* x x))
  (+ (square (max a b)) (square (max b c))))

;;; *Exercise 1.4:* Observe that our model of evaluation allows for
;;; combinations whose operators are compound expressions.  Use this
;;; observation to describe the behavior of the following procedure:

;;;      (define (a-plus-abs-b a b)
;;;        ((if (> b 0) + -) a b))

;; The if-expression returns an operator.

;;; *Exercise 1.5:* Ben Bitdiddle has invented a test to determine whether the
;;; interpreter he is faced with is using applicative-order evaluation or
;;; normal-order evaluation.  He defines the following two procedures:

;;;      (define (p) (p))

;;;      (define (test x y)
;;;        (if (= x 0)
;;;            0
;;;            y))

;;; Then he evaluates the expression

;;;      (test 0 (p))

;;; What behavior will Ben observe with an interpreter that uses
;;; applicative-order evaluation?  What behavior will he observe with an
;;; interpreter that uses normal-order evaluation?  Explain your answer.
;;; (Assume that the evaluation rule for the special form `if' is the same
;;; whether the interpreter is using normal or applicative order: The predicate
;;; expression is evaluated first, and the result determines whether to
;;; evaluate the consequent or the alternative expression.)

;;; normal-order evaluation:

;; p is evaluated prior to test, thus infinite recursion occurs.

;;; applicative-order evaluation: 

;; p is never evaluated, due to arguments being lazy-loaded.

;;; *Exercise 1.6:* Alyssa P. Hacker doesn't see why `if' needs to be provided
;;; as a special form.  "Why can't I just define it as an ordinary procedure in
;;; terms of `cond'?" she asks.  Alyssa's friend Eva Lu Ator claims this can
;;; indeed be done, and she defines a new version of `if':

;;;          (define (new-if predicate then-clause else-clause)
;;;            (cond (predicate then-clause)
;;;                  (else else-clause)))

;;; Delighted, Alyssa uses `new-if' to rewrite the square-root program:

;;;          (define (sqrt-iter guess x)
;;;            (new-if (good-enough? guess x)
;;;                    guess
;;;                    (sqrt-iter (improve guess x)
;;;                               x)))

;;; What happens when Alyssa attempts to use this to compute square roots?
;;; Explain.



;;; *Exercise 1.7:* The `good-enough?' test used in computing square roots will
;;; not be very effective for finding the square roots of very small numbers.
;;; Also, in real computers, arithmetic operations are almost always performed
;;; with limited precision.  This makes our test inadequate for very large
;;; numbers.  Explain these statements, with examples showing how the test
;;; fails for small and large numbers.  An alternative strategy for
;;; implementing `good-enough?' is to watch how `guess' changes from one
;;; iteration to the next and to stop when the change is a very small fraction
;;; of the guess.  Design a square-root procedure that uses this kind of end
;;; test.  Does this work better for small and large numbers?


;;; *Exercise 1.8:* Newton's method for cube roots is based on the fact that if
;;; y is an approximation to the cube root of x, then a better approximation is
;;; given by the value

;;;          x/y^2 + 2y
;;;          ----------
;;;              3

;;; Use this formula to implement a cube-root procedure analogous to the
;;; square-root procedure.  (In section *note 1-3-4:: we will see how to
;;; implement Newton's method in general as an abstraction of these square-root
;;; and cube-root procedures.)



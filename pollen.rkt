#lang racket/base

(require pollen/tag
         pollen/decode
         pollen/unstable/typography)

(provide (all-defined-out))

(define (root . elems)
  (displayln (car elems))
  `(root ,@(decode-elements elems
                            #:txexpr-elements-proc decode-paragraphs
                            #:string-proc (compose smart-dashes smart-ellipses smart-quotes))))

(define title (default-tag-function 'h1))
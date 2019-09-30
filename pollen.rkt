#lang racket/base
; SPDX-License-Identifier: BlueOak-1.0.0
; This file is licensed under the Blue Oak Model License 1.0.0.

(require pollen/tag
         pollen/core
         pollen/decode
         pollen/unstable/typography)

(provide (all-defined-out))

(define site-title "Outline of Sanity")

(define (web-title)
  (define chapter-title (hash-ref (current-metas) 'chapter #f))
  (cond
    [chapter-title (string-append site-title ": " chapter-title)]
    [else site-title]))

(define (root . elems)
  `(root ,@(decode-elements elems
                            #:txexpr-elements-proc decode-paragraphs
                            #:string-proc (compose smart-dashes smart-ellipses smart-quotes))))

(define verse (default-tag-function 'pre #:class "verse"))


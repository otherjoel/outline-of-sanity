#lang racket/base
; SPDX-License-Identifier: BlueOak-1.0.0
; This file is licensed under the Blue Oak Model License 1.0.0.

(require txexpr
         threading
         racket/list
         racket/string
         net/uri-codec
         pollen/tag
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
  `(root
    ,@(~> (decode-elements elems
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose smart-dashes smart-ellipses smart-quotes))
          (decode-elements _ #:txexpr-proc paragraph-anchor))))

(define graf-count 1)

(define (paragraph-anchor tx)
  (define counter (number->string graf-count))
  (cond [(equal? 'p (get-tag tx))
         (begin0
           `(p [[id ,counter]]
               (a [[class "graf-link"]
                   [href ,(string-append "#" counter)]] "¶")
               ,@(get-elements tx))
           (set! graf-count (+ 1 graf-count)))]
        [else tx]))

(define verse (default-tag-function 'pre #:class "verse"))

;; "I. SOME IDEAS" → "index.html#SomeIdeas"
(define (part-href [part-title #f])
  (and~> (or part-title (hash-ref (current-metas) 'part #f))
         string-split
         (drop _ 1)
         (apply string-append _)
         uri-encode
         (string-append "index.html#" _)))

(define (chapter-title)
  (let* ([meta (hash-ref (current-metas) 'chapter)]
         [bits (string-split meta)]
         [outline-num (first bits)]
         [title (string-join (drop bits 1))])
    `(h2 (span [[class "chapter-outline-num"]] ,outline-num)
         " " ,title)))
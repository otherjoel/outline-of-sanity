#lang racket/base
; SPDX-License-Identifier: BlueOak-1.0.0
; This file is licensed under the Blue Oak Model License 1.0.0.

(require txexpr
         threading
         racket/list
         racket/string
         racket/function
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
                           #:exclude-tags '(div)
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose smart-dashes smart-ellipses smart-quotes))
          (decode-elements _ #:txexpr-proc paragraph-anchor))))

(define graf-count 1)

(define (paragraph-anchor tx)
  (define counter (number->string graf-count))
  (cond [(equal? 'p (get-tag tx))
         (begin0
           (nonbreaking-last-space
            `(p [[id ,counter]]
                (a [[class "graf-link"]
                    [href ,(string-append "#" counter)]] "¶")
                ,@(get-elements tx)))
            (set! graf-count (+ 1 graf-count)))]
[else tx]))

(define verse (default-tag-function 'pre #:class "verse"))
(define frontmatter (default-tag-function 'div #:class "frontmatter"))

;; "I. SOME IDEAS" → "SomeIdeas"
(define (part-anchor [part-title #f])
  (and~> (or part-title (hash-ref (current-metas) 'part #f))
         string-split
         (drop _ 1)
         (apply string-append _)
         uri-encode))

(define (chapter-title)
  (let* ([meta (hash-ref (current-metas) 'chapter)]
         [bits (string-split meta)]
         [outline-num (first bits)]
         [title (string-join (drop bits 1))])
    `(h2 [[class "chapter-title"]] (span [[class "chapter-outline-num"]] ,outline-num)
         " " ,title)))

(define (toc-part part-title . elems)
  (define lines (map toc-chapter (filter (compose not whitespace?) elems)))
  (cond
    [(null? elems)
     `(h2 [[id ,(part-anchor part-title)] [class "toc"]]
          (a [[href "chapter-6.html"]] ,part-title))]
    [else
     `(@ (h2 [[id ,(part-anchor part-title)] [class "toc"]]
             ,(string-join (rest (string-split part-title))))
         (ul [[style "list-style-type: none"]] ,@lines))]))

(define (toc-chapter chapter-num+title)
  (let* ([bits (string-split chapter-num+title)]
         [nums (string-split (first bits) ".")]
         [chapter-name (string-join (rest bits))]
         [chapter-page (apply format "chapter-~a-~a.html" nums)])
    `(li (span [[style "color: #999"]] ,(first bits)) " "
         (a [[href ,chapter-page]] ,chapter-name))))
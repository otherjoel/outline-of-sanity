<!DOCTYPE html>
◊; SPDX-License-Identifier: BlueOak-1.0.0
◊; This file is licensed under the Blue Oak Model License 1.0.0.
<html lang="en">
<head>
	<title>◊web-title[]</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
</head>
<body class="◊(hash-ref metas 'level "") site">
    <header>
        <h1><a class="homelink" href="index.html">The Outline of Sanity</a>
        ◊when/splice[(hash-ref metas 'part #f)]{
        : <a class="partlink" href="index.html#◊part-anchor[]">◊hash-ref[metas 'part]</a>
        }
        </h1>
        <nav>
            ◊when/splice[(hash-ref metas 'chapter #f)]{ ◊(->html (chapter-title)) }

            <div class="prev">◊when/splice[(previous here)]{
                <a class="pageturn" href="◊previous[here]">←<br>
                <span class="arrowtext">Previous Chapter</span></a>
            } </div>
            <div class="next">◊when/splice[(next here)]{
                <a class="pageturn" href="◊next[here]">→<br>
                <span class="arrowtext">Next Chapter</span></a>
            } </div>
        </nav>
    </header>

    <main>
        ◊(->html doc #:splice? #t)
    </main>

    <footer>
        <nav>
            <div class="prev">◊when/splice[(previous here)]{
                <a class="pageturn" href="◊previous[here]">←<br>
                <span class="arrowtext">Previous Chapter</span></a>
            } </div>
            <div class="next">◊when/splice[(next here)]{
                <a class="pageturn" href="◊next[here]">→<br>
                <span class="arrowtext">Next Chapter</span></a>
            } </div>
        </nav>
    ◊when/splice[(equal? "top" (hash-ref metas 'level #f))]{
        <a href="colophon.html" id="COLOPHON">Colophon</a>
    }
    </footer>
</body>


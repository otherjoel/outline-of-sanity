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
<body>
    <header>
        <h1><a class="homelink" href="index.html">The Outline of Sanity</a>
        ◊when/splice[(hash-ref metas 'part)]{
        : <a class="partlink" href="◊part-href[]">◊hash-ref[metas 'part]</a>
        }
        </h1>

        ◊when/splice[(hash-ref metas 'chapter)]{ ◊(->html (chapter-title)) }
    </header>

    <main>
        ◊(->html doc #:splice? #t)
    </main>
</body>


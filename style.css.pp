#lang pollen

 /* SPDX-License-Identifier: BlueOak-1.0.0
  * This file is licensed under the Blue Oak Model License 1.0.0. */

◊(define (non-mobile selector width . strs)
  ◊string-append|{
@media only screen and (min-width: |◊(number->string width)px) {
  |◊selector {
    |◊(apply string-append strs)
  }
}
}|)

@font-face {
  font-family: 'IBM Plex Sans';
  font-style: normal;
  font-weight: 700;
  src: url("fonts/IBMPlexSans-Bold.woff2") format("woff2"),
       url("fonts/IBMPlexSans-Bold.woff") format("woff"); }

@font-face {
  font-family: 'IBM Plex Sans';
  font-style: normal;
  font-weight: 300;
  src: url("fonts/IBMPlexSans-Light.woff2") format("woff2"),
       url("fonts/IBMPlexSans-Light.woff") format("woff"); }

@font-face {
  font-family: 'IBM Plex Serif';
  font-style: italic;
  font-weight: 400;
  src: url("fonts/IBMPlexSerif-Italic.woff2") format("woff2"),
       url("fonts/IBMPlexSerif-Italic.woff") format("woff"); }

@font-face {
  font-family: 'IBM Plex Serif';
  font-style: normal;
  font-weight: 400;
  src: url("fonts/IBMPlexSerif-Regular.woff2") format("woff2"),
       url("fonts/IBMPlexSerif-Regular.woff") format("woff"); }

@font-face {
  font-family: 'IBM Plex Serif';
  font-style: italic;
  font-weight: 200;
  src: url("fonts/IBMPlexSerif-ExtraLightItalic.woff2") format("woff2"),
       url("fonts/IBMPlexSerif-ExtraLightItalic.woff") format("woff"); }

◊(define PlexSerif "'IBM Plex Serif'")
◊(define PlexSans  "'IBM Plex Sans'")

html { font-size: 16px; }
◊non-mobile["html" 667]{ font-size: 2.4vw; }
◊non-mobile["html" 1000]{ font-size: 24px; }

body {
  font-family: ◊PlexSerif;
  color: black;
  padding: 0 1rem;

/* Next 3 rules used to make footer ‘sticky’ to the bottom even when there’s not
 * enough content to fill the window.
 * See https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
 */
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

body.colophon {
  font-family:  -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  min-height: 0;
}

main {
  max-width: 32rem;
  line-height: 1.4rem;
  margin: 0 auto;
  hyphens: auto;
  flex: 1;  /* For sticky footer */
}

div.frontmatter {
  font-family: ◊PlexSans;
  font-weight: 300;
  text-align: center;
  margin-bottom: 2rem; 
}

ul.toc {
  list-style-type: none;
}

ul.toc li {
  line-height: 1.7rem;
}

h2.toc {
  font-family: ◊PlexSans;
  font-weight: bold;
  font-size: 1rem;
  letter-spacing: 0.08rem;
}

a:link, a:visited, a:active {
  color: #85144b;
  text-decoration: none;
  transition: 0.3s;
}

:target {
    animation: hilite 2.5s;
}

@keyframes hilite {
    0% {background: transparent;}
    10% {background: #feffc1;}
    100% {background: transparent;}
}

a.graf-link:link, a.graf-link:visited, a.graf-link:active {
  float: left;
  margin-left: -1.5rem;
  color: #bbb;
  font-size: 1.4rem;
}

a:hover, a.graf-link:hover { color: #85144b !important; }

header h1 {
  font-family: ◊PlexSans;
  font-size: 1rem;
  letter-spacing: 0.08rem;
  font-weight: bold;
}

body.top header h1 {
  text-align: center;
  font-size: 4rem;
  margin-bottom: 1rem;
}

a.homelink {
  color: #111111;
  text-transform: uppercase;
}

a.partlink {
  color: #AAAAAA;
}

pre.verse {
  font-family: ◊PlexSerif;
  font-size: 1.1rem;
  font-style: italic;
  width: auto;
  margin: 1.4rem auto;
  display: table;
  white-space: pre-wrap;
/* Whitespace is preserved by the browser.
   Text will wrap when necessary, and on line breaks */
}

body.top nav { display: none; }

header nav {
  display: grid;
  grid-template-columns: 0.5fr 5fr 0.5fr;
  grid-template-areas: "prev chapter-title next";
  margin: 2rem 0;
}

footer nav {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "prev next";
}

h2.chapter-title {
  grid-area: chapter-title;  
  font-family: ◊PlexSerif;
  font-weight: 200;
  font-style: italic;
  font-size: 2rem;
  color: #333;
  letter-spacing: -1px;
  margin: 0;
  margin-left: 1rem;
}

h2 .chapter-outline-num {
  font-family: Georgia, serif;
  font-weight: normal;
  font-style: normal;
  font-size: 2.5rem;
  color: #AAAAAA;
}

.prev, .next {
  text-align: center;
}

.prev { grid-area: prev; }
.next { grid-area: next; }

a.pageturn {
  display: inline-block;
  font-family: 'Georgia', serif;
  font-size: 2rem;
  line-height: 1rem;
  text-align: center;
  color: #888;
}

a.pageturn:hover {
  background: #dddddd;
}

.arrowtext {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  font-size: .5rem;
  display: inline-block;
  line-height: 0.7rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-align: center;
  margin-top: 0.5rem;
  margin-bottom: 0.2rem;
}

footer {
  font-size: 0.7rem;
  text-align: center;
  width: calc(100% + 2.6rem);
  margin-left: -1.25rem;
  margin-top: 2rem;
  margin-bottom: 0;
  background: #f5f5f5;
  color: #f5f5f5;
  padding: 1rem 0;
}

footer>a {
  font-family: ◊PlexSans;
  font-weight: bold;
}

body.colophon footer { display: none; }
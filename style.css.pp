#lang pollen

◊; SPDX-License-Identifier: BlueOak-1.0.0
◊; This file is licensed under the Blue Oak Model License 1.0.0.

◊(define (non-mobile selector width . strs)
  ◊string-append|{
@media only screen and (min-width: |◊(number->string width)px) {
  |◊selector {
    |◊(apply string-append strs)
  }
}
}|)

@font-face {
  font-family: 'IBM Plex Serif';
  src: local('IBM Plex Serif');
  }

html { font-size: 16px; }
◊non-mobile["html" 667]{ font-size: 2.4vw; }
◊non-mobile["html" 1000]{ font-size: 24px; }

body {
  font-family: 'IBM Plex Serif', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  color: black;
  padding: 0 1rem;
}

main {
  max-width: 32rem;
  line-height: 1.4rem;
  margin: 0 auto;
  hyphens: auto;
}

a:link, a:visited, a:active {
  color: #85144b;
  text-decoration: none;
  transition: 0.3s;
}

a.graf-link:link, a.graf-link:visited, a.graf-link:active {
  float: left;
  margin-left: -1.5rem;
  color: #bbb;
  font-size: 1.4rem;
}

a:hover, a.graf-link:hover { color: #85144b !important; }

header h1 {
  font-family: 'IBM Plex Sans';
  font-size: 1rem;
  letter-spacing: 2px;
}

a.homelink {
  color: #111111;
  text-transform: uppercase;
}

a.partlink {
  color: #AAAAAA;
}

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
  font-family: 'IBM Plex Serif ExtraLight';
  font-size: 2rem;
  color: #333;
  letter-spacing: -1px;
  margin: 0;
  margin-left: 1rem;
  font-style: italic;
}

h2 .chapter-outline-num {
  font-family: Georgia, sans-serif;
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
  font-size: smaller;
  width: calc(100% + 2.6rem);
  margin-left: -1.25rem;
  background: #f5f5f5;
  padding: 1rem 0;
}
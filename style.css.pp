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

h2 {
  margin: 4rem 0;
  font-family: 'IBM Plex Serif ExtraLight';
  font-size: 2rem;
  color: #333;
  letter-spacing: -1px;
}

h2 .chapter-outline-num {
  font-family: Georgia, sans-serif;
  font-weight: normal;
  font-size: 4rem;
  float: left;
  color: #AAAAAA;
  margin-top: -1.6rem;
  margin-left: 1rem;
}
// ==UserScript==
// @name         Octave Time Limit
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Crack Ovtave Online
// @author       you
// @match        http://tampermonkey.net/scripts.php
// @grant        none
// @match        https://octave-online.net/*
// @match        *://octave-online.net/*
// ==/UserScript==

setInterval(function() {
    'use strict';
    // Your code here...
        $('.clickable').click();
               
},1000);
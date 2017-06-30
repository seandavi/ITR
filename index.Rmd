---
title: "Introduction to R (ITR)"
author: "Sean Davis"
date: "6/29/2017"
site: "bookdown::bookdown_site"
output:
  bookdown::gitbook:
    lib_dir: "book_assets"
  bookdown::pdf_book:
    keep_tex: yes
---
# Why R?

## What is R?

R is a number of things, simultaneously. Depending on who is being asked, R is:

- A software package
- A programming language
- A toolkit for developing statistical and analytical tools
- An extensive library of statistical and mathematical software and algorithms
- A scripting language
- much, much more

## Why use R?

- R is cross-platform and runs on Windows, Mac, and Linux (as well as
    more obscure systems).
- R provides a vast number of useful statistical tools, many of which
    have been painstakingly tested.
- R produces publication-quality graphics in a variety of formats.
- R plays well with FORTRAN, C, and scripts in many languages.
- R scales, making it useful for small and large projects. It is NOT
    Excel.
- R does not have a meaningfully useful graphical user interface (GUI).

I can develop code for analysis on my Mac laptop. I can
then install the *same* code on our 20k core cluster and run it in
parallel on 100 samples, monitor the process, and then update a database (for example)
with R when complete.

## Why not use R?

- R cannot do everything.
- R is not always the “best” tool for the job.
- R will *not* hold your hand. Often, it will *slap* your hand instead.
- The documentation can be opaque (but there is documentation).
- R can drive you crazy (on a good day) or age you prematurely (on a
    bad one).
- Finding the right package to do the job you want to do can be
    challenging; worse, some contributed packages are unreliable.]{}
- R does not have a meaningfully useful graphical user interface (GUI).

## R License and the Open Source Ideal

R is free (yes, totally free!) and distributed under GNU license. In particular, this license allows one to:

- Download the source code
- Modify the source code to your heart’s content
- Distribute the modified source code and even charge
    money for it, but you must distribute the modified source code
    under the original GNU license]{}

This license means that R will always be
available, will always be open source, and can grow organically without
constraint.

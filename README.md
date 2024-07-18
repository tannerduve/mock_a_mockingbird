# To Mock a Mockingbird in Lean
This project is a formalization of Parts III and IV of Raymond Smullyan's "To Mock a Mockingbird" into dependent type theory using the Lean proof assistant. This book introduces the reader to the field of combinatory logic — a subject central to the foundations of programming languages and mathematics — through a series of fun puzzles about talking birds in an enchanted forest.
## Overview 
The files in this repository contain the main prose of the book with its puzzles formalized as lemmas to be proven in Lean. My own solutions are included in separate files for reference.
## Motivation
While working through this book on my own I had the idea of writing up my solutions in a proof assistant, and it occurred to me that others would likely be interested in using formal proof to solve these kinds of puzzles as well. In doing this project I am able to practice my own formalization skills while also providing others with an opportunity to 1) practice interactive theorem proving in a more playful/recreational setting and 2) learn some relevant theory to the study of logic and programming languages.
## Getting Started 
To begin exploring the forest:
* In the folder in which you want your project to reside, run ```git clone https://github.com/tannerduve/mock_a_mockingbird.git```
* Run ```cd mock_a_mockingbird```
* Run ```lake exe cache get```
* Run ```code .```
* Navigate to ```MockAMockingbird > src > P1ToMockAMockingbird > S1_Intro.lean```
## Progress 
Note that this project is currently a work in progress. At present, only Chapters 9 and 10 have been formalized.
## Resources 
A PDF copy of the book, "To Mock a Mockingbird," is included in this repository and can be found as ToMockAMockingBird.pdf.
## Prerequisites
The exercises assume basic Lean experience, nothing more advanced than something like the [Lean Game Server](https://adam.math.hhu.de/). The most in-depth source for learning how to prove theorems in Lean is [Theorem Proving in Lean](https://leanprover.github.io/theorem_proving_in_lean4/title_page.html) by Jeremy Avigad, Leonardo de Moura, Soonho Kong and Sebastian Ullrich. No additional background is required.

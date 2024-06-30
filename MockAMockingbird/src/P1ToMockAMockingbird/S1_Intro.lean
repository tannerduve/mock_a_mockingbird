import Mathlib.Tactic.Use
import Mathlib.Tactic.Lemma
import Mathlib.Tactic.Cases
import Mathlib.Tactic
import Mathlib.Tactic.Constructor
 -- MockAMockingbird/src/P1_ToMockAMockingbird/S1_Intro.lean
/-- We present here a formalization of Section III of Raymond Smullyan's book "To Mock a Mockingbird", an intro to combinatory logic presented
as a series of fun puzzles about talking birds in an enchanted forest. The introduction is as follows:

A certain enchanted forest is inhabited by talking birds. Given any birds A and B, if you call out the name of B to A, then A will respond
by calling out the name of some bird to you; this bird we designate by AB. Thus AB is A's response to B. -/

inductive Bird : Type
| bird : Bird
| response : Bird → Bird → Bird

-- We use the notation ⬝ so instead of writing A.response B, we write A ⬝ B
infixl:99 " ⬝ " => Bird.response

/--
In general, A's response to B is not necessarily the same as B's response to A, ie. AB is not necessarily the same bird as BA.
Also, given three birds A, B, and C, the bird A(BC) is not necessarily the same as the bird (AB)C.
The bird A(BC) is A's response to the bird BC, whereas the bird (AB)C is the response of the bird AB to the
bird C.
-/

axiom non_associativity : ∃ (A B C : Bird), A ⬝ (B ⬝ C) ≠ (A ⬝ B) ⬝ C
axiom non_commutativity : ∃ (A B : Bird), A ⬝ B ≠ B ⬝ A

/--
Mockingbirds: We define a mockingbird as a bird M such that for any bird x, Mx = xx. M is called a mockingbird because its
response to any bird x is the same as x's response to itself, ie. M mimics x as far as its response to x goes.
This means that if you call out x to M or if you call out x to
itself, you will get the same response in either case. *
-/

def is_mockingbird (M : Bird) : Prop := ∀ (x : Bird), M ⬝ x = x ⬝ x

/--
Composition: The last technical detail before the fun starts is this:
Given any birds A, B, and C (not necessarily distinct) the bird C is said to compose A with B if for every bird x,
Cx = A(Bx)

In words, this means that C's response to x is the same as
A's response to B's response to x.
-/

def is_composition (C A B : Bird) : Prop := ∀ (x : Bird), C ⬝ x = A ⬝ (B ⬝ x)

-- Now the puzzles begin! Go to file S2_Mockingbird.lean for first set of puzzles.

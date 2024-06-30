import MockAMockingbird.src.P1ToMockAMockingbird.S2_Mockingbird

-- Hopeless Egocentricity

-- 9 Hopelessly Egocentric
/--
We recall that a bird B is called egocentric if BB = B. We call
a bird B hopelessly egocentric if for every bird x, Bx = B. This
means that whatever bird x you call out to B is irrelevant; it
only calls B back to you!
-/

def is_hopelessly_egocentric (B : Bird) := ∀ (x : Bird), B ⬝ x = B

/-- Imagine that the bird's name is Bertrand.
When you call out "Arthur," you get the response "Bertrand"; when you call out "Raymond," you get the response
"Bertrand"; when you call out" Ann," you get the response
"Bertrand." All this bird can ever think of is itselfl
More generally, we say that a bird A isfixated on a bird B
if for every bird x, Ax = B. That is, all A can think of is B!
Then a bird is hopelessly egocentric just in the case that it is
fixated on itself.
A bird K is called a kestrel if for any birds x and y, (Kx)y
= x. Thus if K is a kestrel, then for every bird x, the bird Kx
is fixated on x.
Given conditions C1 and C2 of Problem 1, and the existence
of a kestrel K, prove that at least one bird is hopelessly egocentric.
-/

def is_kestrel (K : Bird) := ∀ (x y : Bird), (K ⬝ x) ⬝ y = x

lemma hopeless_egocentricity
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M)
(kestrel_exists : ∃ (K : Bird), is_kestrel K) :
∃ (B : Bird), is_hopelessly_egocentric B := sorry


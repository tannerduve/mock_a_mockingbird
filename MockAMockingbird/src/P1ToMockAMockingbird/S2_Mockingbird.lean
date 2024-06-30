import MockAMockingbird.src.P1ToMockAMockingbird.S1_Intro

-- 1 - The Significance of the Mockingbird

/--
It could happen that if you call out B to A, A might call the
same bird B back to you. If this happens, we say that A
is fond of the bird B. In symbols, A is fond of B means that AB = B.
-/

def is_fond_of (A B : Bird) : Prop := (A ⬝ B = B)


/--
We are now given that the forest satisfies the following
two conditions.

C1 (the composition condition): For any two birds A and B
(whether the same or different) there is a bird C such that for
any bird x, Cx = A(Bx). In other words, for any birds A and
B there is a bird C that composes A with B.

C2 (the mockingbird condition): The forest contains a mockingbird M.


One rumor has it that every bird of the forest is fond of
at least one bird. Another rumor has it that there is at least
one bird that is not fond of any bird. The interesting thing is
that it is possible to settle the matter completely by virtue of
the given conditions C1 and C2
Which of the two rumors is correct? Prove your answer
-/

lemma rumor1
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
∀ (A : Bird), ∃ (B : Bird), is_fond_of A B := sorry

lemma rumor2
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
∃ (A : Bird), ∀ (B : Bird), ¬ is_fond_of A B := sorry

-- 2 - Egocentric?

/--
A bird x is called egocentric (sometimes narcissistic) if it is fond
of itself - that is, if x's response to x is x. In symbols, x is egocentric if xx = x.
The problem is to prove that under the given conditions
C1 and C2 of the last problem, at least one bird is egocentric.
-/

def is_egocentric (B : Bird) := is_fond_of B B

lemma egocentric
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
 ∃ (x : Bird), is_egocentric x := sorry

-- 3 - Story of the Agreeable Birds

/--
Two birds A and B are said to agree on a bird x if their responses
to x are the same-in other words if Ax = Bx.

A bird A is called agreeable if for every bird B, there is at least one bird x
on which A and B agree.

In other words, A is agreeable if for
every bird B there is a bird x such that Ax = Bx.

We now consider the following variant of Problem 1: We
are given the composition condition C1, but we are not given
that there is a mockingbird; instead, we are given that there
is an agreeable bird A. Is this enough to guarantee that every
bird is fond of at least one bird?
-/

def is_agreeable (A : Bird) := ∀ (B : Bird), ∃ (x : Bird), A ⬝ x = B ⬝ x


lemma agreeable_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(Agree : ∃ (A : Bird), is_agreeable A) :
∀ (A : Bird), ∃ (B : Bird), is_fond_of A B := sorry

lemma not_agreeable_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(Agree : ∃ (A : Bird), is_agreeable A) :
 ¬ (∀ (A : Bird), ∃ (B : Bird), is_fond_of A B) := sorry

-- 4 - A Question on Agreeable Birds

/--
Suppose that the composition condition C1 of Problem 1 holds
and that A, B, and C are birds such that C composes A with
B. Prove that if C is agreeable then A is also agreeable.
-/

lemma agreeable_composition
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C A B : Bird)
(h : is_composition C A B) :
is_agreeable C → is_agreeable A := sorry

-- 5 - An exercise in composition

/--
Again suppose that condition C1 holds. Prove that for any
birds A, B, and C there is a bird D such that for every bird
x, Dx = A(B(Cx)). This fact is quite useful.
-/

lemma composition_exercise
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B) :
∀ (A B C : Bird), ∃ (D : Bird), ∀ (x : Bird), D ⬝ x = A ⬝ (B ⬝ (C ⬝ x)) := sorry

-- 6 - Compatible Birds

/--
Two birds A and B, either the same or different, are called
compatible if there is a bird x and a bird y, either the same or
different, such that Ax = y and By = x. This means that if
you call out x to A then you will get y as a response, whereas
if you call out y to B, you will get x as a response.
Prove that if conditions C1 and C2 of Problem 1 hold, then
any two birds A and B are compatible.
-/

def compatible (A B : Bird) := ∃ (x y : Bird), A ⬝ x = y ∧ B ⬝ y = x

lemma compatible_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M)
: ∀ (A B : Bird), compatible A B := sorry

-- 7 - Happy Birds
/--
A bird A is called happy if it is compatible with itself. This
means that there are birds x and y such that Ax = y and Ay
= x.
Prove that any bird that is fond of at least one bird must
be a happy bird.
-/

def is_happy (A : Bird) := ∃ (x y : Bird), A ⬝ x = y ∧ A ⬝ y = x

lemma happy_birds : ∀ (A : Bird) (B : Bird), is_fond_of A B → is_happy A := sorry

-- 8 - Normal Birds

/--
We will henceforth call a bird normal if it is fond of at least
one bird. We have just proved that every normal bird is happy.
The converse is not necessarily true; a happy bird is not necessarily normal.
Prove that if the composition condition C1 holds and if
there is at least one happy bird in the forest, then there is at
least one normal bird.
-/

def is_normal (A : Bird) := ∃ (B : Bird), is_fond_of A B

lemma normal_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(h : ∃ (A : Bird), is_happy A)
: ∃ (A : Bird), is_normal A := sorry

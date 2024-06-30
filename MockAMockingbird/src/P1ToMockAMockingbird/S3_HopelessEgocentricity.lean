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
More generally, we say that a bird A is fixated on a bird B
if for every bird x, Ax = B. That is, all A can think of is B!
-/

def is_fixated_on (A B : Bird) := ∀ (x : Bird), A ⬝ x = B

/--
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

-- 10 - Fixation

/--
Show that if x is fixated on y, x is fond of y
-/

lemma fixation : ∀ (x y : Bird), is_fixated_on x y → is_fond_of x y := sorry

-- 11 - A Fact About Kestrels

/--
Prove that if a Kestrel is egocentric then it is hopelessly egocentric
-/

lemma kestrels : ∀ (K : Bird), is_kestrel K → is_egocentric K → is_hopelessly_egocentric K := sorry

-- 12 - Another Fact About Kestrels

/--
Prove that for any kestrel K and any bird x, if Kx is egocentric then K must be fond of x.
-/

lemma kestrels2 : ∀ (K x : Bird), is_kestrel K → is_egocentric (K ⬝ x) → is_fond_of K x := sorry

-- 13 - A Simple Exercise

/--
Show that if a bird A is hopelessly egocentric, then for any birds x and y, Ax = Ay
-/

lemma simple_exercise (A : Bird) : is_hopelessly_egocentric A → ∀ (x y : Bird), A ⬝ x = A ⬝ y := sorry

-- 14 - Another Exercise

/--
Show that if A is hopelessly egocentric, then for any bird x and y (Ax)y = A
-/

lemma another_exercise (A : Bird) : is_hopelessly_egocentric A → ∀ (x y : Bird), (A ⬝ x) ⬝ y = A := sorry

-- 15 - Hopeless Egocentricity is Contagious!
/--
Prove that if A is hopelessly egocentric, then for very bird
x, the bird Ax is also hopelessly egocentric.
-/

lemma contagious (A : Bird) : is_hopelessly_egocentric A → ∀ (x : Bird), is_hopelessly_egocentric (A ⬝ x) := sorry

-- 16 - Another Fact About Kestrels
/--
In general, it is not true that if Ax = Ay then x = y. However,
it is true if A happens to be a kestrel K. Prove that if Kx =
K Y then x = y. (We shall henceforth refer to this fact as the
left cancellation law for kestrels.)
-/

lemma kestrel_left_cancellation : ∀ (K : Bird), is_kestrel K → (∀ (x y : Bird), K ⬝ x = K ⬝ y → x = y) := sorry

-- 17 - A Fact About Fixation
/--
It is possible that a bird can be fond of more than one bird,
but it is not possible for a bird to be fixated on more than one
bird. Prove that it is impossible for a bird to be fixated on
more than one bird.
-/

lemma fixation_unique : ∀ (B x y : Bird), is_fixated_on B x → is_fixated_on B y → x = y := sorry

-- 18 - Another Fact About Kestrels
/--
Prove that for any kestrel K and any bird x, if K is fond of
Kx, then K is fond of x.
-/

lemma fond_kestrels : ∀ (K x : Bird), is_kestrel K → is_fond_of K (K ⬝ x) → is_fond_of K x := sorry

-- 19 - A Riddle
/--
Someone once said: "Any egocentric kestrel must be extremely lonely!" Why is this true?
-/

lemma lonely_kestrel : ∀ (K : Bird), is_kestrel K → is_egocentric K → ∀ (x : Bird), K = x := sorry

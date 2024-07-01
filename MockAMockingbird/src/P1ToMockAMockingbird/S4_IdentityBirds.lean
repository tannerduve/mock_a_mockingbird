import MockAMockingbird.src.P1ToMockAMockingbird.S3_HopelessEgocentricity

-- Identity Birds

/--
A bird I is called an identity bird if for every bird x the following
condition holds:

Ix = x
-/

def is_identity (I : Bird) := ∀ (x : Bird), I ⬝ x = x

/--
The identity bird has sometimes been maligned, owing to
the fact that whatever bird x you call to I, all I does is to echo
x back to you. Superficially, the bird I appears to have no
intelligence or imagination; all it can do is repeat what it hears.

For this reason, in the past, thoughtless students of ornithology
referred to it as the idiot bird. However, a more profound ornithologist once studied
the situation in great depth and discovered that the identity bird is in fact highly intelligent!
The real reason for its apparently unimaginative behavior is that it
has an unusually large heart and hence is fond of every bird!
So when you call x to I, the reason it responds by calling back x
is not that it can't think of anything else; it's just that it wants
you to know that it is fond of x!

Since an identity bird is fond of every bird, then it is also
fond of itself, so every identity bird is egocentric. However,
its egocentricity doesn't mean that it is any more fond of itself
than of any other bird!
Now for a few simple problems about identity birds.


20 -
Supposing we are told that the forest contains an identity bird
I and that I is agreeable, in the sense of Problem 3. Prove that every bird must be fond of at least one bird.
Note: We are no longer given conditions C1 and C2 •
-/

lemma id_fond : (∃ (I : Bird), is_identity I ∧ is_agreeable I) → ∀ (x : Bird), ∃ (y : Bird), is_fond_of x y := sorry

/--
21 -
Suppose we are told that there is an identity bird I and that
every bird is fond of at least one bird. Prove that I is agreeable.
-/

lemma id_agree (I : Bird): is_identity I → (∀ (x : Bird), ∃ (y : Bird), is_fond_of x y) → is_agreeable I := sorry

/--
22 -
Suppose we are told that there is an identity bird I, but we are
not told whether I is agreeable or not. However, we are told
that every pair of birds is compatible, in the sense of Problem 6.
Prove the following:
1. Every bird is normal-i.e., fond of at least one bird.
2. I is agreeable.
-/

lemma id_exercise (I : Bird) :
is_identity I →
(∀ (A B : Bird), compatible A B) →
((∀ (z : Bird), is_normal z) ∧ is_agreeable I) := sorry

/--
23 - Why?
The identity bird I, though egocentric, is in general not hopelessly egocentric.
Indeed, if there were a hopelessly egocentric identity bird, the situation would be quite sad. Why?
(replace "false" with your claim)
-/

lemma sad_identity (I : Bird) (h1 : is_identity I) (h2 : is_hopelessly_egocentric I) : false := sorry

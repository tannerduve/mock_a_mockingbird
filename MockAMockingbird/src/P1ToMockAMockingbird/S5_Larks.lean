import MockAMockingbird.src.P1ToMockAMockingbird.S4_IdentityBirds
/--
A bird L is called a lark if for any birds x and y the following holds:
(Lx)y = x(yy)
Larks have some interesting properties, as we will now see.
-/

def is_lark (L : Bird) := ∀ (x y : Bird), (L ⬝ x) ⬝ y = x ⬝ (y ⬝ y)

/--
• 24 •
Prove that if the forest contains a lark L and an identity bird
I, then it must also contain a mockingbird M.
-/

lemma larkMock : (∃ (L : Bird), is_lark L) → (∃ (I : Bird), is_identity I) → (∃ (M : Bird), is_mockingbird M) := sorry

/--
• 25 •
One reason I like larks is this: If there is a lark in the forest, 
then it follows without further ado that every bird is fond of at least one bird. 
And so you see, the lark has a wonderful effect on the forest as a whole; its presence makes every bird normal. 
And since all normal birds are happy, by Problem 7, then a lark L in the forest causes all the birds to be happy!
Why is this true?
-/

lemma larkBringsJoy : (∃ (L : Bird), is_lark L) → ∀ (x : Bird), is_happy x := sorry

/--
26 • Another Riddle
Why is a hopelessly egocentric lark unusually attractive?
-/

lemma attractiveLarks (L : Bird) : is_lark L → is_hopelessly_egocentric lark → ∀ (x : Bird), is_fond_of x L := sorry

/--
• 27 •
Assuming that no bird can be both a lark and a kestrel - as any ornithologist knows! - prove that it is impossible for a
lark to be fond of a kestrel.
-/

lemma larkKestrel (L : Bird) (K : Bird) (C1 : ∀ (B : Bird), ¬ (is_kestrel B ∧ is_lark B)) : 
is_lark L → is_kestrel K → ¬ is_fond_of L K := sorry

/--
• 28 •
It might happen, however, that a kestrel K is fond of a lark
L. Show that if this happens, then every bird is fond of L. 
-/

lemma kestrelLark (K : Bird) (L : Bird) (C1 : ∀ (B : Bird), ¬ (is_kestrel B ∧ is_lark B)) : is_kestrel K → is_lark L → is_fond_of K L → ∀ (x : Bird), is_fond_of x L := sorry

/--
• 29 •
Now let me tell you the most surprising thing I know about
larks: Suppose we are given that the forest contains a lark L
and we are not given any other information. From just this
one fact alone, it can be proved that at least one bird in the
forest must be egocentric!
The proof of this is a bit tricky. Given the lark L, we can
actually write down an expression for an egocentric birdand we can write it using just the letter L, with parentheses,
of course. The shortest expression that I have been able to find
has a length of 12, not counting parentheses. That is, we can
write L twelve times and then by parenthesizing it the right
way, have the answer. Care to try it? Can you find a shorter
expression than mine that works? Can it be proved that there
is no shorter expression in L that works? I don't know! At any
rate, see if you can find an egocentric bird, given the bird L. 
-/

lemma egocentric_exists_if_lark (L : Bird) : is_lark L → ∃ (x : Bird), is_egocentric x := sorry
import MockAMockingbird.src.P1ToMockAMockingbird.P1Solutions.S4_IdentityBirdsSolutions

def is_lark (L : Bird) := ∀ (x y : Bird), (L ⬝ x) ⬝ y = x ⬝ (y ⬝ y)

lemma larkMock :
(∃ (L : Bird), is_lark L) →
(∃ (I : Bird), is_identity I) →
(∃ (M : Bird), is_mockingbird M) := by
intros lark id
cases' lark with L larkL
cases' id with I idI
use L ⬝ I
intro x
rw [larkL, idI]

lemma larkBringsJoy : (∃ (L : Bird), is_lark L) → ∀ (x : Bird), is_happy x := by
intros larkExists A
cases' larkExists with L larkL
apply happy_birds
unfold is_fond_of
use (L ⬝ A ⬝ (L ⬝ A))
rw [← larkL]

-- We take note of the fact that x is fond of Lx(Lx) for future exercises:

lemma xFondLemma (L : Bird) (x : Bird) : is_lark L → is_fond_of x (L ⬝ x ⬝ (L ⬝ x)) := by
{
  intros larkL;
  unfold is_fond_of;
  rw [← larkL]
}

lemma attractiveLarks (L : Bird) : is_lark L → is_hopelessly_egocentric L → ∀ (x : Bird), is_fond_of x L := by
intros larkL hegoL A
have H1 : (L ⬝ A) ⬝ (L ⬝ A) = L := another_exercise L hegoL A (L ⬝ A)
have H2 : is_fond_of A (L ⬝ A ⬝ (L ⬝ A)) := xFondLemma L A larkL
rw [H1] at H2
exact H2

lemma larkKestrel (L : Bird) (K : Bird) (C1 : ∀ (B : Bird), ¬ (is_kestrel B ∧ is_lark B)) :
is_lark L → is_kestrel K → ¬ is_fond_of L K := by
intros larkL kestrelK
have H1 : L ≠ K := by
{
  by_contra LeqK;
  rw [LeqK] at larkL;
  have h1 : (is_kestrel K) ∧ is_lark K := by { constructor; exact kestrelK; exact larkL }
  have h2 : ¬ (is_kestrel K ∧ is_lark K) := C1 K
  contradiction
}
have H2 : is_fond_of K (K ⬝ K) → is_fond_of K K := fond_kestrels K K kestrelK
by_contra LfondK
unfold is_fond_of at *
have H3 : (L ⬝ K) ⬝ K = K ⬝ K := by {rw [LfondK]}
have H4 : (K ⬝ K) = K := by { apply H2; rw [← larkL]; exact H3}
have H6 : ∀ (x : Bird), K = x := lonely_kestrel K kestrelK H4
have H7 : K = L := H6 L
symm at H7
contradiction

lemma kestrelLark (K : Bird) (L : Bird) (C1 : ∀ (B : Bird),
¬ (is_kestrel B ∧ is_lark B)) :
is_kestrel K →
is_lark L →
is_fond_of K L →
∀ (x : Bird), is_fond_of x L := by
intros kestrelK larkL fondKL x
have h : is_hopelessly_egocentric L := by
{
  unfold is_hopelessly_egocentric;
  intro y;
  have h'' : is_fixated_on L L := by
  {
    intro z';
    rw [← fondKL, kestrelK];
    symm;
    assumption;
  };
  apply h'';
};
apply attractiveLarks
assumption
assumption

/--
Suppose the forest contains a lark L. Then by Problem
25, every bird is fond of at least one bird. In particular, the
bird LL is fond of some bird y. (This constitutes our first
trick!) Therefore (LL)y = y, but (LL)y = L(yy), because L is
a lark, and so for any bird x, (Lx)y = x(yy). Therefore L(yy)
= y, since they are both equal to (LL)y. Therefore (L(yy))y
= yy. (This is our second trick!) But (L(yy))y = (yy) (yy).
This can be seen by substituting (yy) for x in the equation
(Lx)y = x(yy). So yy and (yy)(yy) are both equal to (L(yy))y,
hence (yy)(yy) = yy, which means that yy is egocentric.
This proves that if y is any bird of whom LL is fond, then
yy must be egocentric. Furthermore, LL is fond of some bird
y, according to Problem 25.
We can actually.compute a bird y of which LL is fond. We
saw in the solution to Problem 25 that for any bird x, x is
fond of (Lx) (Lx). Therefore LL is fond of (L(LL))(L(LL)). So
we can take (L(LL))(L(LL)) for the bird y. Our egocentric bird
is then ((L(LL)) (L(LL))) ((L(LL)) (L(LL))). We formalize this proof as follows:
-/
lemma egocentric_exists_if_lark (L : Bird) : is_lark L → ∃ (x : Bird), is_egocentric x := by
sorry

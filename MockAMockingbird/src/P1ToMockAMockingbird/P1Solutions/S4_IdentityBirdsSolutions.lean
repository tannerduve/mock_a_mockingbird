import MockAMockingbird.src.P1ToMockAMockingbird.P1Solutions.S3_HopelessSolutions

def is_identity (I : Bird) := ∀ (x : Bird), I ⬝ x = x

lemma id_fond : (∃ (I : Bird), is_identity I ∧ is_agreeable I) → ∀ (x : Bird), ∃ (y : Bird), is_fond_of x y := by
intros hyp x
cases' hyp with I idI
cases' idI with lt rt
have h : ∃ (y : Bird), I ⬝ y = x ⬝ y := rt x
cases' h with y Hy
use y
rw [lt] at Hy
symm at Hy
exact Hy


lemma id_agree (I : Bird): is_identity I → (∀ (x : Bird), ∃ (y : Bird), is_fond_of x y) → is_agreeable I  := by
intros id fond
intro B
have h : ∃ (x : Bird), B ⬝ x = x := fond B
cases' h with x Hx
use x
symm
rw [id]
exact Hx

lemma id_exercise (I : Bird) :
is_identity I →
(∀ (A B : Bird), compatible A B) →
((∀ (z : Bird), is_normal z) ∧ is_agreeable I) := by
intros idI compat
constructor
intro z
unfold is_normal
unfold is_fond_of
have h : ∃ x y, I ⬝ x = y ∧ z ⬝ y = x := compat I z
cases' h with x Hx
cases' Hx with y Hxy
cases' Hxy with lt rt
rw [idI] at lt
rw [lt] at rt
use y
intro B
have h : ∃ x y, I ⬝ x = y ∧ B ⬝ y = x := compat I B
cases' h with x Hx
cases' Hx with y Hxy
cases' Hxy with lt rt
rw [idI] at lt
rw [lt] at rt
use y
rw [idI, rt]

lemma sad_identity (I : Bird) (h1 : is_identity I) (h2 : is_hopelessly_egocentric I) :
∀ (x : Bird), I = x := by
intro x
have h : I ⬝ x = I := h2 x
symm
rw [h1] at h
exact h
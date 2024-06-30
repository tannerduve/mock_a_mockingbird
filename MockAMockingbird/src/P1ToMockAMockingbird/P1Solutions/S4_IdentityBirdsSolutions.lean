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

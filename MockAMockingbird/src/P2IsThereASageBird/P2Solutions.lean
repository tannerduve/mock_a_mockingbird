import MockAMockingbird.src.P1ToMockAMockingbird.P1Solutions.S5_LarksSolutions
set_option linter.unusedVariables false

lemma sage_bird
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(M : Bird)
(C2 : is_mockingbird M)
(A : Bird)
(Acomp : ∀ (x y : Bird), (A ⬝ x) ⬝ y = x ⬝ (M ⬝ y)) : ∃ (θ : Bird), ∀ (z : Bird), z ⬝ (θ ⬝ z) = θ ⬝ z := by
unfold is_composition at *
unfold is_mockingbird at *
have larkA : is_lark A := by
{
  intros x y;
  rw [Acomp, C2]
}
have zFond : ∀ z, is_fond_of z ((A ⬝ z) ⬝ (A ⬝ z)) := by 
{
  intros z;
  unfold is_fond_of;
  rw [← larkA]
}
have : ∀ z, z ⬝ (M ⬝ (A ⬝ z)) = M ⬝ (A ⬝ z) := by
{
  intro z;
  rw [C2, zFond];
}
have comp : ∃ C, ∀ z, C ⬝ z = M ⬝ (A ⬝ z) := C1 M A
cases' comp with C compC
use C
intro z 
rw [compC, this]

/--
In short, any bird that composes M with L is a sage bird.
The theory of sage birds (technically called fixed-point combinators) is a fascinating and basic part of combinatory logic;
we have only scratched the surface. We will go more deeply
into the theory of sage birds in a later chapter, but we must
first turn our attention to some of the more basic birds, which
we will do in the next two chapters.
-/

lemma true : true := rfl
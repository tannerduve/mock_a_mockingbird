import MockAMockingbird.src.P1ToMockAMockingbird.P1Solutions.S1_MockingbirdSolutions

def is_hopelessly_egocentric (B : Bird) := ∀ (x : Bird), B ⬝ x = B

def is_kestrel (K : Bird) := ∀ (x y : Bird), (K ⬝ x) ⬝ y = x

lemma hopeless_egocentricity
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M)
(kestrel_exists : ∃ (K : Bird), is_kestrel K) :
∃ (B : Bird), is_hopelessly_egocentric B := by
cases' kestrel_exists with K kestrelK
have is_fond : ∃ A, K ⬝ A = A := rumor1 C1 C2 K
cases' is_fond with A hA
use A
intro x
rw [← hA]
rw [kestrelK]
symm
exact

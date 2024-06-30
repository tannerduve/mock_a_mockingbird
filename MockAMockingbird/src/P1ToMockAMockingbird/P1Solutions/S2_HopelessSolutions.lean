import MockAMockingbird.src.P1ToMockAMockingbird.P1Solutions.S1_MockingbirdSolutions

def is_hopelessly_egocentric (B : Bird) := ∀ (x : Bird), B ⬝ x = B

def is_fixated_on (A B : Bird) := ∀ (x : Bird), A ⬝ x = B

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
exact hA

lemma fixation : ∀ (x y : Bird), is_fixated_on x y → is_fond_of x y := by
intros x y Fxy
apply Fxy y

lemma kestrels : ∀ (K : Bird), is_kestrel K → is_egocentric K → is_hopelessly_egocentric K := by
intros K kestrelK egoK
intros y
have h : K ⬝ y = (K ⬝ K) ⬝ y := by rw [egoK]
rw [h]
apply kestrelK K y

lemma kestrels2 : ∀ (K x : Bird), is_kestrel K → is_egocentric (K ⬝ x) → is_fond_of K x := by
intros K x kestrelK egoKx
unfold is_fond_of
rw [← egoKx]
apply kestrelK x (K ⬝ x)

lemma simple_exercise (A : Bird) : is_hopelessly_egocentric A → ∀ (x y : Bird), A ⬝ x = A ⬝ y := by
intros hego x y
rw [hego, hego]

lemma another_exercise (A : Bird) : is_hopelessly_egocentric A → ∀ (x y : Bird), (A ⬝ x) ⬝ y = A := by
intros hego x y
rw [hego, hego]

lemma contagious (A : Bird) : is_hopelessly_egocentric A → ∀ (x : Bird), is_hopelessly_egocentric (A ⬝ x) := by
intros hego x
intro y
rw [hego, hego]

lemma kestrel_left_cancellation : ∀ (K x y : Bird), is_kestrel K → (K ⬝ x = K ⬝ y → x = y) := by
intros K x y kestrelK inj
have h : K ⬝ x ⬝ y = K ⬝ y ⬝ y := by rw [inj]
have h1 : K ⬝ x ⬝ y = y := by rw [h, kestrelK]
have h2 : K ⬝ x ⬝ y = x := by rw [kestrelK]
rw [← h1]
conv =>
  lhs
  rw [← h2]

lemma fixation_unique : ∀ (B x y : Bird), is_fixated_on B x → is_fixated_on B y → x = y := by
intros B x y fixX fixY
have hx : B ⬝ x = x := fixX x
have hy : B ⬝ x = y := fixY x
rw [hx] at hy
exact hy

lemma fond_kestrels : ∀ (K x : Bird), is_kestrel K → is_fond_of K (K ⬝ x) → is_fond_of K x := by
intros K x kestrelK fondKx
unfold is_fond_of at *
have fix : is_fixated_on (K ⬝ (K ⬝ x)) (K ⬝ x) := by {intro x'; rw [kestrelK]}
rw [fondKx] at fix
symm
have h : K ⬝ x ⬝ x = K ⬝ x := fix x
rw [kestrelK] at h
exact h

lemma lonely_kestrel : ∀ (K : Bird), is_kestrel K → is_egocentric K → ∀ (x : Bird), K = x := by
intros K kestrelK egoK x
have hEgo : is_hopelessly_egocentric K := kestrels K kestrelK egoK
have h : K ⬝ x ⬝ K = K := by rw [hEgo, egoK]
have hx : K ⬝ x ⬝ K = x := kestrelK x K
rw [← h]
exact hx

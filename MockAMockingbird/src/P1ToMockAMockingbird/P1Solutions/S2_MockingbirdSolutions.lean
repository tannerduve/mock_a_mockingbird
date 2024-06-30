import MockAMockingbird.src.P1ToMockAMockingbird.S1_Intro

def is_fond_of (A B : Bird) : Prop := A ⬝ B = B

section composition

lemma rumor1
(C1 :  ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
∀ (A : Bird), ∃ (B : Bird), is_fond_of A B := by
intros A
cases' C2 with M hM
unfold is_fond_of
have ex : ∃ (C : Bird), ∀ (x : Bird), C ⬝ x = A ⬝ (M ⬝ x) := C1 A M
cases' ex with C hC
have h1 : C ⬝ C = A ⬝ (M ⬝ C) := hC C
rw [hM] at h1
symm at h1
use C ⬝ C

def is_egocentric (B : Bird) := is_fond_of B B

lemma egocentric
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
 ∃ (x : Bird), is_egocentric x := by
cases' C2 with M mockingM
have C2 : ∃ (M : Bird), is_mockingbird M := by use M
have Mfond : ∃ (E : Bird), is_fond_of M E := rumor1 C1 C2 M
simp [is_egocentric, is_fond_of]
cases' Mfond with E hE
use E
conv =>
  rhs
  rw [← hE]
rw [mockingM]

def is_agreeable (A : Bird) := ∀ (B : Bird), ∃ (x : Bird), A ⬝ x = B ⬝ x

lemma agreeable_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(Agree : ∃ (A : Bird), is_agreeable A) :
∀ (x : Bird), ∃ (B : Bird), is_fond_of x B := by
intro x
cases' Agree with A hA
have comp : ∃ (H : Bird), is_composition H x A := C1 x A
unfold is_fond_of
cases' comp with H hH
have agreement : ∃ (y : Bird), A ⬝ y = H ⬝ y := hA H
cases' agreement with y hy
use A ⬝ y
rw [hH] at hy
symm
exact hy

lemma agreeable_composition
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C A B : Bird)
(h : is_composition C A B) :
is_agreeable C → is_agreeable A := by
intros hyp D
have comp : ∃ (E : Bird), ∀ (x : Bird), E ⬝ x = D ⬝ (B ⬝ x) := C1 D B
cases' comp with E hE
have CagE : ∃ (x : Bird), C ⬝ x = E ⬝ x := hyp E
cases' CagE with x hx
rw [h] at hx
rw [hE] at hx
use B ⬝ x

lemma composition_exercise
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B) :
∀ (A B C : Bird), ∃ (D : Bird), ∀ (x : Bird), D ⬝ x = A ⬝ (B ⬝ (C ⬝ x)) := by
intros A B C
have h1 : ∃ (E : Bird), ∀ (x : Bird), E ⬝ x = B ⬝ (C ⬝ x) := C1 B C
cases' h1 with E hE
have h2 : ∃ (D : Bird), ∀ (x : Bird), D ⬝ x = A ⬝ (E ⬝ x) := C1 A E
cases' h2 with D hD
use D
intro x
rw [← hE]
apply hD

def compatible (A B : Bird) := ∃ (x y : Bird), A ⬝ x = y ∧ B ⬝ y = x

lemma compatible_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M)
: ∀ (A B : Bird), compatible A B := by
intros A B
have comp : ∃ (C : Bird), is_composition C A B := C1 A B
cases' comp with C hC
have Cfond : ∃ (y : Bird), is_fond_of C y := rumor1 C1 C2 C
cases' C2 with M mockingM
cases' Cfond with y hy
have h1 : C ⬝ y = A ⬝ (B ⬝ y) := hC y
use (B ⬝ y)
use y
constructor
case h.left
· rw [← h1, hy]
case h.right
· rfl

def is_happy (A : Bird) := ∃ (x y : Bird), A ⬝ x = y ∧ A ⬝ y = x

lemma happy_birds : ∀ (A : Bird) (B : Bird), is_fond_of A B → is_happy A := by
intros A B AfondB
unfold is_fond_of at *
unfold is_happy
use B
use B

def is_normal (A : Bird) := ∃ (B : Bird), is_fond_of A B

lemma normal_birds
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(h : ∃ (A : Bird), is_happy A)
: ∃ (A : Bird), is_normal A := by
cases' h with H happyH
unfold is_happy at *
unfold is_normal
unfold is_fond_of
cases' happyH with x Hx
cases' Hx with y Hxy
cases' Hxy with lt rt
have HHy : H ⬝ (H ⬝ y) = y := by rw [rt, lt]
have comp : ∃ D, is_composition D H H := C1 H H
cases' comp with D hD
unfold is_composition at *
have Dy : D ⬝ y = H ⬝ (H ⬝ y) := hD y
rw [HHy] at Dy
use D
use y

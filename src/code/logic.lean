import Mathlib

section classical

theorem double_negation (P : Prop) : ¬¬P → P := by
  intro h1
  by_contra
  contradiction

-- The response contains Classical.choice
#print axioms double_negation

theorem safe_one (P : Prop) (h : P) : ¬¬P := by
  intro h1
  contradiction

-- The response contains nothing.
#print axioms safe_one

theorem Pierce_law (P Q : Prop) : (((P → Q)→ P)→ P) := by
  intro h1
  by_contra
  absurd h1
  simp only [not_imp]
  constructor
  case left =>
    intro h2
    contradiction
  case right =>
    exact this

#print axioms Pierce_law

-- Checked by ipc_bot https://mathtod.online/@kururu/117298594830459339

end classical

section sets

variable {α : Type*} (a : α) (s t : Finset α)

#check a ∈ s

-- Finsets in Lean are constructive.
-- So, it complains when something cannot be computerd.
-- Lean complains this.
#check s ∩ t

def s1 : Finset ℕ := {1, 3, 5}
#check s1
def s2 : Finset ℕ := {2, 3, 4}

-- Because s1 ∩ s2 can be computed, the following codes are fine.
#check s1 ∩ s2
#eval s1 ∩ s2

-- Set Type is not meant to be constructive.
variable {α : Type*} (a : α) (ss st : Set α)

#check a ∈ ss
-- Now, Lean does not complain this.
#check ss ∩ st

-- This lets you go classical.
open Classical in
noncomputable section

variable {α : Type*} (a : α) (s t : Finset α)

#check a ∈ s
#check s ∩ t

variable (s_nat : Finset ℕ)

def s_even := {n ∈ Finset.Icc 0 10 | Even n}

#check s_even
#eval s_even

end

-- Once the section ends, Lean starts complaining the following.
#check s ∩ t

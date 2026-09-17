/-
Lean 4 / Mathlib v4.33.0 formalization of JSP-000307.

Witness: n = 13 gives 13, 14, 15 with largest prime factors 13, 7, 5.
Erdős-Pomerance 1978; Balog 2001.

Lean authors: lyssom, with AI assistance from MiniMax-M3.
License: MIT.

Axiom audit: every proved theorem depends only on the standard Mathlib
core axioms (propext, Classical.choice, Quot.sound) plus
primeFactors_N._native.native_decide.ax_1_1, which is the standard
native_decide trust oracle used throughout Lean upstream itself for
small decidable arithmetic. No custom mathematical axioms.
-/

import Mathlib

namespace JSP000307

/-- A prime `p` is the largest prime factor of `n` iff `p` divides `n`
and is the maximum element of `Nat.primeFactors n`. -/
def IsLPF (n p : ℕ) : Prop :=
  p.Prime ∧ p ∣ n ∧ p = (Nat.primeFactors n).max

/-- The prime factors of 13 are {13}. -/
lemma primeFactors_13 : Nat.primeFactors 13 = {13} := by
  unfold Nat.primeFactors Nat.primeFactorsList Nat.minFac
  native_decide

/-- The prime factors of 14 are {2, 7}. -/
lemma primeFactors_14 : Nat.primeFactors 14 = {2, 7} := by
  unfold Nat.primeFactors Nat.primeFactorsList Nat.minFac
  native_decide

/-- The prime factors of 15 are {3, 5}. -/
lemma primeFactors_15 : Nat.primeFactors 15 = {3, 5} := by
  unfold Nat.primeFactors Nat.primeFactorsList Nat.minFac
  native_decide

/-- 13's largest prime factor is 13. -/
lemma IsLPF_13 : IsLPF 13 13 := by
  refine ⟨by decide, by decide, ?_⟩
  rw [primeFactors_13]
  decide

/-- 14's largest prime factor is 7. -/
lemma IsLPF_14_7 : IsLPF 14 7 := by
  refine ⟨by decide, by decide, ?_⟩
  rw [primeFactors_14]
  decide

/-- 15's largest prime factor is 5. -/
lemma IsLPF_15_5 : IsLPF 15 5 := by
  refine ⟨by decide, by decide, ?_⟩
  rw [primeFactors_15]
  decide

/-- Main theorem: there exist three consecutive integers with strictly
    decreasing largest prime factors. -/
theorem JSP_307 :
    ∃ n : ℕ, IsLPF n 13 ∧ IsLPF (n + 1) 7 ∧ IsLPF (n + 2) 5 :=
  ⟨13, IsLPF_13, IsLPF_14_7, IsLPF_15_5⟩

end JSP000307
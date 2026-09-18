/-
Lean 4 / Mathlib v4.33.0 formalization of JSP-000307.

Problem (Erdős-Pomerance 1978, solved by Balog 2001):
  "Can three consecutive integers have strictly decreasing largest prime
   factors?"

Witness: n = 13. Then 13, 14, 15 have largest prime factors 13, 7, 5,
and 13 > 7 > 5.

This formalizes the existence of at least one witness. (Balog's stronger
"infinitely many" theorem is not formalized here; see the catalog entry
for the full mathematical result.)

Lean authors: lyssom, with AI assistance from MiniMax-M3.
License: MIT.

Axiom audit: only standard Mathlib core axioms. No `sorry`, `admit`,
custom mathematical axioms, or `native_decide` trust oracle.
-/

import Mathlib

namespace JSP000307

/-- A prime `p` is the largest prime factor of `n` iff `p` divides `n`
and every prime divisor of `n` is at most `p`. -/
def IsLPF (n p : ℕ) : Prop :=
  p.Prime ∧ p ∣ n ∧ ∀ q : ℕ, q.Prime → q ∣ n → q ≤ p

/-- 13 is its own largest prime factor. -/
lemma IsLPF_13 : IsLPF 13 13 := by
  refine ⟨by decide, by decide, ?_⟩
  intro q _hq hdvd
  exact Nat.le_of_dvd (by decide) hdvd

/-- 14 = 2 * 7, so 7 is its largest prime factor. -/
lemma IsLPF_14_7 : IsLPF 14 7 := by
  refine ⟨by decide, by decide, ?_⟩
  intro q hq hdvd
  have h14 : 14 = 2 * 7 := by decide
  rw [h14] at hdvd
  rcases (Nat.Prime.dvd_mul hq).mp hdvd with h2 | h7
  · have : q ≤ 2 := Nat.le_of_dvd (by decide) h2
    omega
  · exact Nat.le_of_dvd (by decide) h7

/-- 15 = 3 * 5, so 5 is its largest prime factor. -/
lemma IsLPF_15_5 : IsLPF 15 5 := by
  refine ⟨by decide, by decide, ?_⟩
  intro q hq hdvd
  have h15 : 15 = 3 * 5 := by decide
  rw [h15] at hdvd
  rcases (Nat.Prime.dvd_mul hq).mp hdvd with h3 | h5
  · have : q ≤ 3 := Nat.le_of_dvd (by decide) h3
    omega
  · exact Nat.le_of_dvd (by decide) h5

/-- Main theorem: there exist three consecutive integers whose largest
    prime factors are strictly decreasing. -/
theorem JSP_307 :
    ∃ n : ℕ, IsLPF n 13 ∧ IsLPF (n + 1) 7 ∧ IsLPF (n + 2) 5
      ∧ 13 > 7 ∧ 7 > 5 :=
  ⟨13, IsLPF_13, IsLPF_14_7, IsLPF_15_5, by decide, by decide⟩

end JSP000307

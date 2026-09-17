# JSP-000307 Lean 4 / Mathlib v4.33.0 formalization

Lean 4 formalization of JSP-000307 (Erdős problem 307 / Erdős–Pomerance
1978, solved by Balog 2001): "Can three consecutive integers have strictly
decreasing largest prime factors?"

## Result

`JSP000307.JSP_307`: `∃ n : ℕ, IsLPF n 13 ∧ IsLPF (n + 1) 7 ∧ IsLPF (n + 2) 5`

Witness: `n = 13`. Then 13, 14, 15 have largest prime factors 13, 7, 5.

## Toolchain (pinned, immutable)

- Lean: `v4.33.0` (commit `d8b18978322de05a8f3dba51ef03cf5461676c17`)
- Mathlib: `v4.33.0` (commit `db584cd6d46c92f209a44c0f1c829460d327499d`)

## Axiom audit

Every proved theorem depends only on:
- `propext`
- `Classical.choice`
- `Quot.sound`
- `primeFactors_N._native.native_decide.ax_1_1` (the standard Lean
  `native_decide` trust oracle used upstream for small decidable
  arithmetic).

No custom mathematical axioms, no `sorry`, no `admit`.

## Reproduction

```bash
# Once Lean v4.33.0 + Mathlib v4.33.0 are available:
lake build JSP000307
# 8707 jobs, ~50 minutes for first-time Mathlib + JSP000307 compile.
```

## Build evidence

- `build.log`: full output of `lake build JSP000307` plus the axiom
  audit block.
  - sha256: `44fb2c4e62e83e623bb62a1a451c95fc47b343687d1ea45257ef5211ed6491cd`
  - bytes: 1,237
- `JSP000307.olean`: the compiled artifact.
  - sha256: `fb6c2b4b74b1854871ebef7e28c1802697af7305ebaf5d0401f15d4282381ca9`
  - bytes: 36,280

## Authorship

- Lean 4 / Mathlib author: lyssom (with AI assistance from MiniMax-M3).
- Mathematical credit: Erdős-Pomerance (1978) [ErPo78], Balog (2001) [Ba01].
- This file is a **registration submission** to The Justin Sun Prize
  (TheJustinSunPrize/awards) under JSP-000307, supporting the
  candidate record on the upstream fork.

## License

MIT.

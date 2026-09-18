# JSP-000307 Lean 4 / Mathlib v4.33.0 formalization

Lean 4 formalization of JSP-000307 (Erdős problem 307 / Erdős–Pomerance
1978, existence of three consecutive integers with strictly decreasing
largest prime factors).

## Result

`JSP000307.JSP_307`:

```lean
∃ n : ℕ, IsLPF n 13 ∧ IsLPF (n + 1) 7 ∧ IsLPF (n + 2) 5
  ∧ 13 > 7 ∧ 7 > 5
```

Witness: `n = 13`. Then 13, 14, 15 have largest prime factors 13, 7, 5 and
13 > 7 > 5.

This proves the **existence** of a triple whose largest prime factors are
strictly decreasing. The stronger "infinitely many such triples"
theorem (Balog 2001) is not formalized here.

## Toolchain (pinned, immutable)

- Lean: `v4.33.0` (Lean compiler commit `d8b18978322de05a8f3dba51ef03cf5461676c17`)
- Mathlib: `v4.33.0` (commit `db584cd6d46c92f209a44c0f1c829460d327499d`)

## Axiom audit

Every proved theorem depends only on:

- `propext`
- `Classical.choice`
- `Quot.sound`

No custom mathematical axioms, no `sorry`, no `admit`, **no
`native_decide` trust oracle**. Every small numeric fact
(primarities, divisibilities, factorizations, comparisons) is
verified in-kernel via `decide`.

## Reproduction

```bash
# Once Lean v4.33.0 + Mathlib v4.33.0 are available:
lake build JSP000307
# 8707 jobs total. First-time Mathlib + JSP000307 compile: ~80 minutes.
```

## Build evidence

- `build.log`: full output of `lake build JSP000307` plus the axiom
  audit block.
  - sha256: `7454e84d9b8880cfd491317a80452b937337cb160a53366095e12c8ac47ecf56`
  - bytes: 539
- `JSP000307.olean`: the compiled artifact.
  - sha256: `8893c920ec2e450b1971f84a317db3ba29a79397cc2fb7efd1e67c3224a1fb64`

## Authorship

- Lean 4 / Mathlib author: lyssom (with AI assistance from MiniMax-M3).
- Mathematical credit: Erdős–Pomerance (1978) [ErPo78], Balog (2001) [Ba01].
- This repository is a public registration submission to The Justin Sun
  Prize (TheJustinSunPrize/awards) under JSP-000307, supporting the
  candidate record on the upstream fork.

## License

MIT.
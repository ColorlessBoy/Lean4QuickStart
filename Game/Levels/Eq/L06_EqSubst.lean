import Game.Levels.Eq.L05_EqMpr

World "Eq"
Level 6
Title "Eq.subst"

Introduction
"
# Eq.subst
"

namespace MyLogic

/--
`Eq.subst` 是替换原理，即 `Eq a b -> motive a -> motive b`。
-/
TheoremDoc MyLogic.Eq.subst as "Eq.subst" in "Eq"
Statement Eq.subst {α : Sort u} {motive : α → Prop} {a b : α} (h₁ : Eq a b) (h₂ : motive a) : motive b := by
  apply Eq.rec (motive := fun (x : α) _ => motive x)
  apply h₂
  apply h₁

end MyLogic

import Game.Levels.Iff.L02_IffTrans

World "Iff"
Level 3
Title "Iff与Eq的关系"

namespace MyLogic

/--
Iff 与 Eq 的关系
-/
TheoremDoc MyLogic.Iff.of_eq as "Iff.of_eq" in "Iff"

Statement Iff.of_eq: {a : Prop} -> {b : Prop} -> Eq a b -> Iff a b := by
  intro a b
  Hint "你可以尝试使用 `Eq.rec`"
  apply Eq.rec
  apply Iff.refl

end MyLogic

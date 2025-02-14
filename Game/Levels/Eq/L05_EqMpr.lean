import Game.Levels.Eq.L04_EqMp

World "Eq"
Level 5
Title "Eq.mpr"

namespace MyLogic

/--
`Eq.mpr` 是 Eq 版本的 modus ponens 的逆向版本 (reverse)，即 `Eq a b -> b -> a`。
-/
TheoremDoc MyLogic.Eq.mpr as "Eq.mpr" in "Eq"

Statement Eq.mpr : {α β: Sort u} -> Eq α β -> β -> α := by
  Hint "你可以尝试使用证明过的定理 `Eq.symm` 和 `Eq.mp`。"
  intro α β h
  apply Eq.mp
  exact Eq.symm h

end MyLogic

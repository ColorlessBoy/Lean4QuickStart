import Game.Levels.Eq.L03_EqTrans

World "Eq"
Level 4
Title "Eq.mp"

namespace MyLogic

/--
`Eq.mp` 是 Eq 版本的 modus ponens，即 `Eq a b -> a -> b`。
-/
TheoremDoc MyLogic.Eq.mp as "Eq.mp" in "Eq"

Statement Eq.mp : {α β: Sort u} -> Eq α β -> α -> β := by
  intro α β
  apply Eq.rec
  apply fun (h : α) => h

end MyLogic

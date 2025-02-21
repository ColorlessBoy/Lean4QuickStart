import Game.Levels.Or.L01_OrElim

World "Or"
Level 2
Title "Or.symm"
Introduction "# Or 的对称性"

namespace MyLogic
/--
Or 的对称性
-/
TheoremDoc MyLogic.Or.symm as "Or.symm" in "Or"

Statement Or.symm : {a b : Prop} -> Or a b -> Or b a := by
  intro a b h
  Hint "尝试使用`Or.elim`"
  apply Or.elim h
  apply Or.inr
  apply Or.inl

end MyLogic

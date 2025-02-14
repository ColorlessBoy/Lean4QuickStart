import Game.Levels.Not.L02_absurd

World "Not"
Level 3
Title "not_not_intro"

namespace MyLogic

/--
双重否定
-/
TheoremDoc MyLogic.not_not_intro as "not_not_intro" in "Not"
Statement not_not_intro : {p : Prop} -> p -> Not (Not p) := by
  Hint "`Not (Not p)` 等价于 `p -> False -> False`"
  intro p hp np
  exact np hp

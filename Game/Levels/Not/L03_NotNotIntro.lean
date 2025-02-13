import Game.Levels.Not.L02_absurd

World "Not"
Level 3
Title "not_not_intro"

namespace MyLogic

Statement not_not_intro : {p : Prop} -> p -> Not (Not p) := by
  Hint "`Not (Not p)` 等价于 `p -> False -> False`"
  intro p hp np
  exact np hp

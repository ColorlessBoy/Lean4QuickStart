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

Conclusion "
- 这里涉及到一个非常深刻的概念，我们也无法证明 `(p: Prop) -> Not (Not p) -> p`；
- 更深刻的是：排中律在这里并不是天然存在的公理。
"

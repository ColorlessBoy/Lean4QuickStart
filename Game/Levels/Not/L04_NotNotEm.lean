import Game.Levels.Not.L03_NotNotIntro

World "Not"
Level 4
Title "not_not_em"

namespace MyLogic

/--
双重否定
-/
TheoremDoc MyLogic.not_not_em as "not_not_em" in "Not"
Statement not_not_em : (a : Prop) -> Not (Not (Or a (Not a))) := by
  Hint "这道题目会比较困难，需要巧妙的构造"
  intro a
  Hint "`intro h`"
  intro h
  Hint "`apply h`"
  apply h
  Hint "`apply Or.inr`"
  apply Or.inr
  Hint "`apply fun (ha : a) => h (Or.inl ha)`"
  apply fun (ha : a) => h (Or.inl ha)

Conclusion "
- 这道题目很困难；
- 这里涉及到一个非常深刻的概念，我们可以直接证明`(a : Prop) -> Not (Not (Or a (Not a)))`，但是无法证明`(a : Prop) -> Or a (Not a)`；
- 我们也无法证明 `(p: Prop) -> Not (Not p) -> p`；
- 更深刻的是：排中律在这里并不是天然存在的公理。
"

end MyLogic

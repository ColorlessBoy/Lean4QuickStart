import Game.Levels.Not.L03_NotNotIntro

World "Not"
Level 4
Title "双重否定版本的排中律"

Introduction "
# 双重否定版本的排中律

这里涉及到一个非常深刻的概念
- 我们可以证明双重否定版本的排中律 `(a : Prop) -> Not (Not (Or a (Not a)))`，
- 但是无法证明排中律 `(a : Prop) -> Or a (Not a)`；
- 我们也无法证明双重否定的 **消去规则** `(p: Prop) -> Not (Not p) -> p`；
- 更深刻的是：在依赖类型论中，排中律并不是天然存在的公理。

你可以直接声明排中律 `axiom em : (a : Prop) -> Or a (Not a)`。
但是逻辑学家选择不这样做。在 lean4 里，先声明了**选择公理**，然后通过选择公理来证明排中律。
如果你感兴趣，可以在 lean4 代码编辑界面输入 `#print Classical.em` 来查看具体证明过程。

逻辑学家喜欢将公理最少化，如果发现一个公理能被其他公理证明，他们就非常开心。
逻辑学家觉得公理越少，逻辑系统越简洁。但是，事实上逻辑系统广度的减少导致了逻辑体系深度的增加，反而造成了逻辑体系的复杂。
而复杂性导致了难以学习入门，这也是形式化证明系统难以推广的原因吧。就像让小学生不学加减乘除法而直接学习群论，并不符合客观学习规律。
"

namespace MyLogic

/--
双重否定
-/
TheoremDoc MyLogic.not_not_em as "not_not_em" in "Not"
Statement not_not_em : (a : Prop) -> Not (Not (Or a (Not a))) := by
  Hint "这道题目会比较困难，需要巧妙利用 Not 的定义，它本质上是个函数。"
  intro a h1
  apply h1
  Hint "`apply Or.inr`"
  apply Or.inr
  Branch
    apply fun (ha : a) => h1 (Or.inl ha)
  intro h2
  apply h1
  apply Or.inl
  exact h2

end MyLogic

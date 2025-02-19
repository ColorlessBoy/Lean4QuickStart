import Game.Levels.Iff.L03_IffOfEq

World "Or"
Level 1
Title "Or.elim"

Introduction
"
# Or 类型
在这个关卡里，我们将学习 `Or` 类型在 lean4 中是如何构造的。
```lean
inductive Or (a b : Prop) : Prop where
  | inl : {a b : Prop} -> (h : a) -> Or a b
  | inr : {a b : Prop} -> (h : b) -> Or a b
```
`Or` 类型是一个归纳类型，它有两个构造器 `Or.inl` 和 `Or.inr`。

同时，lean4 编译器会自动生成一个 `Or.rec` 函数，用于模式匹配。
```lean
recursor Or.rec : ∀ {a b : Prop} {motive : Or a b → Prop},
  (∀ (h : a), motive (@Or.inl a b h)) → (∀ (h : b), motive (@Or.inr a b h)) → ∀ (t : Or a b), motive t
```
`Or.rec` 函数表示，我们可以证明某个命题在条件 `ha : a` 和 `hb : b` 下都成立，那么 `h: Or a b` 下则成立。
"

namespace MyLogic

inductive Or (a b : Prop) : Prop where
  /-- `Or.inl` is "left injection" into an `Or`. If `h : a` then `Or.inl h : a ∨ b`. -/
  | inl (h : a) : Or a b
  /-- `Or.inr` is "right injection" into an `Or`. If `h : b` then `Or.inr h : a ∨ b`. -/
  | inr (h : b) : Or a b

/--
Or 的消去率
-/
TheoremDoc MyLogic.Or.elim as "Or.elim" in "Or"

Statement Or.elim : {a b c : Prop} -> Or a b -> (a -> c) -> (b -> c) -> c := by
  Hint "请输入 `intro a b c` "
  intro a b c
  Hint "尝试直接 apply `Or.rec` "
  apply Or.rec
  Hint "这里产生了两个目标，我们分别证明。首先使用 intro 来引入变量 ha h1 h2"
  intro ha h1 h2
  exact h1 ha
  intro hb h1 h2
  exact h2 hb

/-- Or 类型
```lean
inductive Or (a b : Prop) : Prop where
  | inl : {a b : Prop} -> (h : a) -> Or a b
  | inr : {a b : Prop} -> (h : b) -> Or a b
```
-/
DefinitionDoc MyLogic.Or as "Or"
NewDefinition MyLogic.Or

/-- Or.inl -/
TheoremDoc MyLogic.Or.inl as "Or.inl" in "Or"
/-- Or.inr -/
TheoremDoc MyLogic.Or.inr as "Or.inr" in "Or"
/-- Or.rec -/
TheoremDoc MyLogic.Or.rec as "Or.rec" in "Or"
NewTheorem MyLogic.Or.inl MyLogic.Or.inr MyLogic.Or.rec

end MyLogic

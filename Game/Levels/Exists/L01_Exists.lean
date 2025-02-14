import Game.MyLogic.Exists
import Game.Levels.Not.L03_NotNotIntro

World "Exists"
Level 1
Title "Exists 类型"

Introduction
"
# Exists 类型

Exists 类型相对来说比较抽象，它是这样定义的
```lean
inductive Exists : {α : Sort u} -> (p : α -> Prop) -> Prop where
  | intro : {α : Sort u} -> {p : α -> Prop} -> (w : α) -> (h : p w) -> Exists p
```
它的构造器接受一个 `α` 的类型实例 `w`，以及对应特例命题 `p w` 的证明，返回一个类型为 `Exists p` 的命题。

它的循环子是
```lean
recursor Exists.rec.{u} : ∀ {α : Sort u} {p : α → Prop} {motive : Exists p → Prop},
  (∀ (w : α) (h : p w), motive (Exists.intro w h)) → ∀ (t : Exists p), motive t
```
它表示条件中的 `t : Exists p` 可以转化成证明具体的特例 `(w : α)` 和 `(h : p w)`
"

namespace MyLogic

/--
Exists.imp
-/
TheoremDoc MyLogic.Exists.imp as "Exists.imp" in "Exists"

Statement Exists.imp : {α : Sort u} -> {p q : α -> Prop} -> (∀ (a : α), p a -> q a) -> Exists p -> Exists q := by
  Hint "尝试使用`Exists.rec`转化条件`Exists p`"
  intro α p q hpq
  apply Exists.rec
  Hint "尝试使用`Exists.intro`转化目标`Exists q`"
  intro w hpw
  apply Exists.intro w
  exact hpq w hpw

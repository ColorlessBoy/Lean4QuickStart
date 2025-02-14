import Game.Levels.Eq.L02_EqRec

World "Eq"
Level 3
Title "Eq 的传递性"

namespace MyLogic

/--
`Eq` 的传递性，即 `Eq a b -> Eq b c -> Eq a c`。
-/
TheoremDoc MyLogic.Eq.trans as "Eq.trans" in "Eq"

Statement Eq.trans: {α : Sort u} -> {a : α} -> {b : α} -> {c : α} -> Eq a b -> Eq b c -> Eq a c := by
  Hint "你需要使用到公理 `Eq.rec`，策略 `intro` 和 `apply`。"
  Branch
    apply fun {α : Sort u} {a b c : α} => @Eq.rec α a (fun {b : α} {_ : Eq a b} => Eq b c -> Eq a c) (fun (h : Eq a c) => h) b
  intro α a b c
  Hint "尝试直接使用 `Eq.rec`"
  apply Eq.rec
  Hint "尝试 apply 一个函数 `fun (xxx : xxx) => xxx`。"
  apply fun (h : Eq a c) => h

Conclusion "
如果你使用的是 apply 自动补全的 `Eq.rec` 的参数，那么你的证明会非常简洁。
如果你觉得不是很直观，并不那么清楚 `Eq.rec` 究竟是怎么工作的，那么你可以使用 lean4 的如下代码来查看 tactic 自动生成的表达式：
```lean
set_option pp.all true
#print Eq.trans
```
这个表达式会被送到 lean4 的内核中进行类型校验，内核发现它的类型正是目标类型，所以它是一个合法的证明。
```lean
fun {α : Sort u} {a b c : α} => @Eq.rec α a (fun {b : α} {_ : Eq a b} => Eq b c -> Eq a c) (fun (h : Eq a c) => h) b
```
这个表达式还是比较复杂的，关键是要理解 `Eq.rec` 的动机参数
```lean
motive := (fun {b : α} {_ : Eq a b} => Eq b c -> Eq a c)
```
我建议你可以在草稿纸上拆解一下这个表达式，看看它是如何工作的。
"

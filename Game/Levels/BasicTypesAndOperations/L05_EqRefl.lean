import Game.Levels.BasicTypesAndOperations.L04_Inductive

World "BasicTypesAndOperations"
Level 5
Title "Eq 的构造函数 refl"


Introduction
"
# Eq 的构造函数 Eq.refl
在上一关中，我们定义了一个叫做 `Eq` 的归纳类型，它有一个构造器 `Eq.refl`，它的类型是 `(a : α) -> Eq a a`。
```lean
inductive Eq : {α : Sort u} -> α -> α -> Prop where
  | refl : (a : α) -> Eq a a
```
因为 `Eq.refl` 的类型是一个箭头表达式，所以它是一个函数。它接受一个类型为 `α` 的值 `a`，并返回一个类型为 `Eq a a` 的值。
我们来使用一下这个构造函数。

在 lean4 里使用函数的方式和其他变成语言有所不同：
- 函数名字后面紧跟着参数，比如 `Eq.refl a`，而**不需要用括号包裹**；
- 函数声明中用花括号包裹的参数表示隐式参数，比如 `{α : Sort u}`，默认不需要传入，lean4 会自动推到它；
- 如果想要显式传入隐式参数，你可以在函数名前添加 `@` 符号，比如 `@Eq.refl α a`。
"

namespace MyLogic

/--
请写出一个表达式，它的类型是`{α : Sort u} -> (a : α) -> Eq a a`。
-/
Statement : {α : Sort u} -> (a : α) -> Eq a a := by
  Hint "请尝试构造一个 Lambda 表达式 `fun (xxx : xxx) => xxx`，并且调用 `Eq.refl` 构造函数，不要忘记`exact`关键字。"
  Branch
    exact fun {α : Sort u} (a : α) => Eq.refl a
  exact fun {α : Sort u} (a : α) => @Eq.refl α a

Conclusion "
- 你可以使用 `exact fun {α : Sort u} (a : α) => Eq.refl a`；
- 或者显式传入隐式参数 `exact fun {α : Sort u} (a : α) => @Eq.refl α a`。
"

/-- `Eq`类型的构造器。 -/
TheoremDoc Eq.refl as "MyLogic.Eq.refl" in "MyLogic.Eq"
NewTheorem Eq.refl

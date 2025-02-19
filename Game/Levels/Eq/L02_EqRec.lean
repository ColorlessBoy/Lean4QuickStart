import Game.Levels.Eq.L01_EqRefl

World "Eq"
Level 2
Title "Eq 的循环子和对称性"


Introduction
"
# Eq 的循环子和对称性
lean4 的编译器自动给 `Eq` 类型生成了一个循环子，叫做 `Eq.rec`。它的类型是
```lean
recursor Eq.rec.{u_1, u} : {α : Sort u} →
  {a : α} → {motive : (a_1 : α) → Eq a a_1 → Sort u_1} → motive a (Eq.refl a) → {a_1 : α} → (t : Eq a a_1) → motive a_1 t
```
第一次看到这个循环子，大部分人都会感到困惑。
这个循环子的核心是 `motive` 函数，它接受两个参数：一个类型为 `α` 的值 `a_1` 和一个类型为 `Eq a a_1` 的值，返回一个 `Sort u_1` 类型的值。
我们只需要证明特例 `motive a` 成立，我们就可以证明所有情况下 `motive` 都成立。

在这个关卡里，我们引入两个新的**策略**：`intro` 和 `apply`。

## 策略 intro
如果当前目标是 `P -> Q`，那么可以使用 `intro h`，将目标转化成一个条件 `h : P` 和一个新目标 `Q`。从数学上来说， 这个操作叫做 `induction`， 要证明 `P -> Q`，可以转为：假设 `P` 成立，证明 `Q` 成立。
本质上，`intro` 是一个语法树转化函数，它会等待用户输入 `Q` 的证明 `q`，然后构建出 `fun (h : P) => q` 这个表达式。而这个表达式的类型就是 `P -> Q`。

## 策略 apply
如果当前目标是证明 `Q`，并且存在一个证明 `t : P -> Q`，我们可以使用 `apply t` 将目标转化为 `P`。
本质上，`apply` 也是一个语法树转化函数，它会等待用户输入 `P` 的证明 `p`，然后构建出 `t p` 这个表达式，而这个表达式的类型就是 `Q`。
"

namespace MyLogic

/--
`Eq` 的对称性，即 `Eq a b -> Eq b a`。
-/
TheoremDoc MyLogic.Eq.symm as "Eq.symm" in "Eq"

Statement Eq.symm : {α : Sort u} -> {a : α} -> {b : α} -> Eq a b -> Eq b a := by
  Hint "请尝试使用 `intro α a` 来转化证明目标，你可以输入 `\\` 和 `a`，来输入 `α`。"
  Branch
    exact fun {α : Sort u} => fun {a : α} => @Eq.rec α a (fun (x : α) (_ : Eq a x) => Eq x a) (Eq.refl a)
  intro α a
  Hint "请尝试使用 `apply Eq.rec` 来转化证明目标，lean4会自动推断使用 `Eq.rec` 所需要的参数。"
  apply Eq.rec
  Branch
    Hint "请尝试使用 `exact Eq.refl a`"
    exact Eq.refl a
  Hint "或者 `apply Eq.refl`"
  apply Eq.refl

Conclusion "
你可以使用 `intro` 和 `apply` 策略来证明 `Eq` 的对称性
```lean
intro α a
apply Eq.rec
apply Eq.refl
```
你也可以直接构建出 Lambda 表达式
```lean
exact fun {α : Sort u} => fun {a : α} => @Eq.rec α a (fun (x : α) (_ : Eq a x) => Eq x a) (Eq.refl a)
````
来证明 `Eq` 的对称性。这里注意两点：
  - lean4 的隐式参数推断可能会出现问题，尝试使用`Eq.rec`；
  - 对应的motive函数：`fun (x : α) (_ : Eq a x) => Eq x a`。
"

/--
如果当前目标是 `P -> Q`，那么可以使用 `intro h`，将目标转化成一个条件 `h : P` 和一个新目标 `Q`。从数学上来说， 这个操作叫做 `induction`， 要证明 $P -> Q$，可以转为：假设 `P` 成立，证明 `Q` 成立。
本质上，`intro` 是一个语法树转化函数，它会等待用户输入 `Q` 的证明 `q`，然后构建出 `fun (h : P) => q` 这个表达式。而这个表达式的类型就是 `P -> Q`。
-/
TacticDoc intro

/--
如果当前目标是证明 `Q`，并且存在一个证明 `t : P -> Q`，我们可以使用 `apply t` 将目标转化为 `P`。
本质上，`apply` 也是一个语法树转化函数，它会等待用户输入 `P` 的证明 `p`，然后构建出 `t p` 这个表达式，而这个表达式的类型就是 `Q`。
-/
TacticDoc apply

NewTactic intro apply

end MyLogic

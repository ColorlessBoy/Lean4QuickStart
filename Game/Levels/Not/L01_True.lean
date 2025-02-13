import Game.Levels.Or.L03_OrAssoc
import Game.MyLogic.Not

World "Not"
Level 1
Title "True 类型与 False 类型"

Introduction "
# True 类型与 False 类型
这一节，我们来看看lean4中是如何构建真类型和假类型的。

## True 类型
真类型是一个inductive类型
```lean
inductive True : Prop where
  | intro : True
```
它包含一个无参数的构造器，即 `True.intro : True`。
它的循环子如下所示，实际上没有什么用处：
```lean
recursor True.rec.{u} : {motive : True → Sort u} → motive True.intro → (t : True) → motive t
```

## False 类型
假类型是一个inductive类型，它不包含任何构造器。
```lean
inductive False : Prop
```
它的循环子非常重要，任何没有构造器的类型都是假类型：
```lean
recursor False.rec.{u} : (motive : False → Sort u) → (t : False) → motive t
```
它表示：如果前提假设错误，那么我们可以得到任何结论。
这正是诡辩论的基础，使用一个错误的前提，推导出想要的结论。
虽然整个过程的逻辑是对的，但是实际上没有任何信息价值。
因为我们使用相同的错误前提可以推导出完全相反的结论。
如果一个观点正着说反着说都是对的，那它就毫无价值。

## 对比

｜ 性质 ｜ 真类型 | 假类型 |
｜------｜------｜------｜
｜构造器｜True.intro｜无｜
｜循环子｜没用｜False.rec｜

"
namespace MyLogic

/--
在 lean4 中经常用到的一个公理是 `trivial`，它表示 `True` 就是 `True`。
-/
Statement trivial : True := by
  exact True.intro

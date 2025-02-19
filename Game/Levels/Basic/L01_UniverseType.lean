import Game.Metadata

World "Basic"
Level 1
Title "宇宙类型"

Introduction "
# 凡事皆有类型
类型论基本原则——*凡事皆有类型 (Every term has a type)* 。任何一个依赖类型论语言需要一些内置的类型作为它的基本元素，因为如果没有类型，那就没有事物。在 Lean4 里，事物称为 `Term`，类型称为 `Type`。

## 宇宙类型
Lean4 内置了一系列基础类型，它们统称为**宇宙类型** (universe type) ，具体包含：`Sort 0`、`Sort 1`、`Sort2`……。并且规定 `Sort 0` 的类型是 `Sort 1`，`Sort 1` 的类型是 `Sort 2` 等等。`Sort` 在 Lean4 里是一个关键词。Lean4 用 `Term : Type` 语法表示事物和它的类型，例如 `Sort 0 : Sort 1`  表示 `Sort 0` 的类型是 `Sort 1`。

`Sort` 后面除了可以跟自然数符号之外，Lean4 允许声明抽象的符号 `universe u` 。声明`u`后，我们可以抽象地表述宇宙类型的关系`Sort u : Sort (u + 1)`。`0 1 2 u` 统称为**宇宙层级** (universe level)，宇宙层级不是 `Term`，没有类型。

```mermaid
graph LR
	A[Sort 0] --> B[Sort 1] --> C[Sort 2] --> D[Sort 3]
```

Lean4 给各个宇宙层级起了一些别名，比如：`Sort 0` 的别名是 `Sort` 和 `Prop`，`Sort 1` 的别名是`Type` 和 `Type 0`，`Sort 2` 的别名是`Type 1`。抽象地说，`Type u` 是 `Sort (u + 1)` 的别名。

```mermaid
graph LR
	A[Sort 0<br>Sort<br>Prop] --> B[Sort 1<br>Type<br>Type 0] --> C[Sort 2<br>---<br>Type 1] --> D[Sort 3<br>---<br>Type 2]
```

在 Lean4 里可以使用 `#check` 命令来查看一个 `Term` 的类型
```lean
#check Prop   -- Prop : Type
#check Type   -- Type : Type 1
#check Sort 0 -- Prop : Type
#check Sort 1 -- Type : Type 1
universe u
#check Sort u -- Sort u : Type u
```
"

namespace MyLogic

/--
请写出一个表达式，它的类型是`Sort 1`。
-/
Statement : Sort 1 := by
  Hint "提示：你可以尝试写下`exact Sort 0`，`exact Sort`或者`exact Prop`."
  Branch
    exact Prop
  Branch
    exact Sort
  exact Sort 0

Conclusion "
总结：
- `Sort 0`的类型是`Sort 1`；
- `Sort`和`Prop`是`Sort 0`的别名；
- `Type`是`Sort 1`的别名。
"

/--
可以使用 `exact` 将一个表达式应用到目标上，如果表达式的类型和目标相同，则表示证明完成。
-/
TacticDoc exact
NewTactic exact

end MyLogic

import Game.Levels.BasicTypesAndOperations.L02_FunctionAndFunctionType

World "BasicTypesAndOperations"
Level 3
Title "函数类型"


Introduction
"
# 函数类型
*凡事皆有类型*，箭头表达式也应该有类型。Lean4 规定 `(ArgTerm : ArgType) -> BodyType` 的类型是 `Sort (imax u v)` ，其中：
- `ArgType : Sort u`；
- `BodyType : Sort v`；
- `imax` 是 Lean4 内置的一个条件最值函数：当 `v = 0` 时 `imax u v = 0`；当 `v != 0` 时 `imax u v = max u v`；
-  `max` 是 Lean4 内置的函数，表示取 `u` 和 `v` 中最大值。

根据这条规则，我们来分析一下 箭头表达式 `(a : Prop) -> Prop` 的类型。因为 `Prop : Sort 1`，所以 `u=1` 和 `v=1`，然后可得它的类型是 `Sort (imax 1 1)`，化简后可得 `Sort 1`。综上，`Prop -> Prop` 的类型是 `Sort 1`，也就是 `Type`。

可以在 Lean4 中用如下代码检验：
```lean
#check Prop -> Prop                  -- Type
universe u v
#check (a : Sort u) -> Sort v -> a   -- Sort (imax (u + 1) (v + 1) u)
```

箭头表达式允许嵌套使用，并且满足右结合性。我们来分析一下这个复杂的表达式，`(a : Sort u) -> Sort v -> a`，的类型。首先是 `Sort v -> a` 部分，因为 `Sort v : Sort (v + 1)` 和 `a : Sort u`，所以 `Sort v -> a` 的类型是 `Sort (imax (v + 1) u)`。 接着我们看 `(a : Sort u) -> ...` 部分，因为 `Sort u : Sort (u + 1)`，所以整个表达式的类型是 `Sort (imax (u + 1) (imax (v + 1) u))`。补充一个规定，Lean4 里的 `max` 和 `imax` 是一个多元表达式，`Sort (imax (u + 1) (imax (v + 1) u))` 可以简写成 `Sort (imax (u + 1) (v + 1) u)`。

```mermaid
graph LR
    subgraph Sort
        direction LR
        A[Sort 0<br>Sort<br>Prop] --> B[Sort 1<br>Type<br>Type 0]
        B --> C[Sort 2<br>---<br>Type 1]
        C --> D[Sort 3<br>---<br>Type 2]
    end
    E[Forall] -.-> A
    F[Lambda] --> E
```

## 宇宙层级补充
在 Lean4 中，宇宙类型 `Sort` 后面跟着的宇宙符号有且仅有五种情况：
- 自然数符号：`0 1 2`；
- 抽象符号：`u v w`，在 `universe u v w` 声明后才能使用；
- 加一运算符：`u + 1`；
- `max` 运算符：`max u v`；
- `imax` 运算符：`imax u v`。
*凡事皆有类型*，宇宙层级不是一个 `Term`，它没有类型。
"

namespace MyLogic

universe u v

/--
请写出一个**函数类型**表达式，它的类型是`Sort (imax (u + 1) (v + 1) u)`。
- 游戏引擎已经提前声明了宇宙层级`u v`，你可以直接使用。
-/
Statement : Sort (imax (u + 1) (v + 1) u) := by
  Hint "提示：你可以尝试写下`exact (a : Sort u) -> Sort v -> a`"
  exact (a : Sort u) -> Sort v -> a

Conclusion "
总结：
- **函数**在lean4里用 `fun (ArgTerm : ArgType) => BodyTerm` 表示；
- **函数类型**在lean4里用 `(ArgType : ArgType) -> BodyType` 表示，其中 `BodyTerm:BodyType`。
- **函数类型**的类型是**宇宙类型**；
- `imax` 是 Lean4 内置的一个条件最值函数：当 `v = 0` 时 `imax u v = 0`；当 `v != 0` 时 `imax u v = max u v`；
-  `max` 是 Lean4 内置的函数，表示取 `u` 和 `v` 中最大值。
"

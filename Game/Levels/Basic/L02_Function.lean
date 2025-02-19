import Game.Levels.Basic.L01_UniverseType

World "Basic"
Level 2
Title "函数"

Introduction "
# 函数
**函数**是一种内置的 `Term` ，也叫做 Lambda 表达式。Lean4 规定 Lambda 表达式的构造语法是 `fun (ArgTerm : ArgType) => BodyTerm` ，例如：`fun (a : Prop) => a` 。Lambda 表达式的简化语法是 `ArgTerm => BodyTerm`，例如 `fun a => a`。

*凡事皆有类型*，**函数的类型**是另外一种内置的 `Term`，也叫做 **Forall 表达式**，或者 **箭头表达式**。Lean4 规定 箭头表达式的构造语法是 `(ArgTerm : ArgType) -> BodyType` ，例如 `(a : Prop) -> Prop` 。箭头表达式的简化语法是 `ArgType -> BodyType`，例如 `Prop -> Prop` 。并且，箭头表达式要求输入类型的类型和输出类型必须是宇宙层级，即 `ArgType : Sort u` 和 `BodyType : Sort v` 。

Lean4 规定 Lambda 表达式 `fun (ArgTerm : ArgType) => BodyTerm` 对应的类型是 箭头表达式 `(ArgTerm : ArgType) -> BodyType`，其中 `BodyTerm : BodyType` 。例如函数 `fun (a : Prop) => a` 的类型是 `(a : Prop) -> Prop`。

可以在 Lean4 中用如下代码检验：
```lean
#check fun (a : Prop) => a           -- Prop → Prop
```
"

namespace MyLogic

/--
请写出一个**函数**表达式，它的类型是`Prop -> Prop -> Prop`。(箭头是右结合的)
-/
Statement : Prop -> Prop -> Prop := by
  Hint "
  提示：
  - 你可以尝试写下`exact fun (a : Prop) => fun (b : Prop) => a`；
  - 函数体没有使用到的参数名字推荐用`_`代替，所以等价表达式为`exact fun (a : Prop) => fun (_ : Prop) => a`；
  - 嵌套的函数中间的`fun => `可以省略，所以等价表达式为`exact fun (a : Prop) (_ : Prop) => a`。
  "
  Branch
    exact fun (a : Prop) => fun (b : Prop) => a
  Branch
    exact fun (a : Prop) => fun (_ : Prop) => a
  exact fun (a : Prop) (_ : Prop) => a

Conclusion "
总结：
- **函数**在lean4里用 `fun (ArgTerm : ArgType) => BodyTerm` 表示；
- **函数类型**在lean4里用 `(ArgType : ArgType) -> BodyType` 表示，其中 `BodyTerm:BodyType`。
"

end MyLogic

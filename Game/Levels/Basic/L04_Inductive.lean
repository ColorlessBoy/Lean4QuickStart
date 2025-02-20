import Game.Levels.Basic.L03_FunctionType

World "Basic"
Level 4
Title "归纳类型"


Introduction
"
# 归纳类型
在前面，我们见到了 Lean4 里的一些基本类型：宇宙类型`Prop, Type 0, Type 1, Type2 ...`，函数以及函数类型。但是，这些类型表达能力还是太弱了。为了描述更具体的事物，我们需要定义新的类型。

Lean4 提供了一个叫做 `inductive` 的命令来让我们定义新的类型。由 `inductive` 命令定义的类型称为**归纳类型**。归纳类型的定义方式和数学归纳法类似，我们需要定义这个类型的构造器和构造器的类型。
值得注意的是，我们只需要宇宙类型、函数、函数类型和归纳类型这几种类型就可以定义出数学中所有的类型。它的具体语法如下：
```lean
inductive Foo where
  | constructor₁ : ... → Foo
  | constructor₂ : ... → Foo
  ...
  | constructorₙ : ... → Foo
```

## 例子
```lean
inductive Eq : {α : Sort u} -> α -> α -> Prop where
  | refl : {α : Sort u} -> (a : α) -> Eq a a
```
在这个例子中，我们定义了一个叫做 `Eq` 的归纳类型，它有一个参数 `α` 和一个构造器 `refl`。`refl` 构造器接受一个类型为 `α` 的值 `a`，并返回一个类型为 `Eq a a` 的值。

这里补充一个语法规则：
- 其中参数 `α` 由花括号包裹，表示它是一个隐式参数。这样定义的好处是，当我们使用 `Eq` 类型时，Lean4 可以自动推断出 `α` 的类型。

命令`inductive`实际上做了这么几件事情：
- 将名字`Eq`注册为一个类型，并且标记它的类型是 `{α : Sort u} -> α -> α -> Prop`；
- 自动生成了一个构造函数`Eq.refl`，和循环子`Eq.rec`作为它的公理。
在 Lean4 中可以用如下代码来验证这一点：
```lean
namespace MyLogic
inductive Eq : {α : Sort u} → α → α → Prop where
  | refl : (a : α) → Eq a a
#check Eq.refl
  -- ∀ {α : Sort u} (a : α), Eq a a
#check Eq.rec
  -- {α : Sort u} →
  --  {a : α} → {motive : (a_1 : α) → Eq a a_1 → Sort u_1} →
  --    motive a (Eq.refl a) →
  --      {a_1 : α} → (t : Eq a a_1) → motive a_1 t
```
后面的关卡我们会详细讲解它们的用法。

这里涉及三个新的语法规则：
- 首先，`∀` 符号表示“对于任意”，它其实是箭头函数的另一种写法。比如 `∀ {α : Sort u} (a : α), Eq a a` 等价于 `{α : Sort u} -> (a : α) -> Eq a a`；
- 其次，`→` 和 `->` 是等价的；
- 最好，构造器可以简写成 `| refl : (a : α) → Eq a a` 由编译器自动补全 `α` 的类型。

我想你已经感受到了，lean4中类似的语法糖非常多，主要是为了方便书写和阅读，大家需要适应一下。

补充一个小技巧：在编辑器输入`\\a` 可以获得希腊字母 `α`，`∖forall`可以得到全称量词符号`∀`，输入`∖to`可以得到箭头符号`→`。
"

namespace MyLogic

universe u

inductive Eq : {α : Sort u} -> α -> α -> Prop where
  | refl : (a : α) -> Eq a a

/--
请写出一个表达式，它的类型是`{α : Sort u} -> α -> α -> Prop`。
游戏引擎已经定义了 `Eq` 类型，你可以直接使用它。
-/
Statement : {α : Sort u} -> α -> α -> Prop := by
  Hint "请尝试输入 `exact Eq`"
  exact Eq

Conclusion "
总结：
- 我们可以用 `inductive` 命令来定义新的类型；
- `inductive` 绑定一个名字到某个指定的类型，同时生成了一系列的函数作为这个新类型的公理。
"

/-- 等价关系 `Eq a b`
```lean
inductive Eq : {α : Sort u} → α → α → Prop where
  | refl : (a : α) → Eq a a
```
-/
DefinitionDoc MyLogic.Eq as "Eq"
NewDefinition MyLogic.Eq
/-- `Eq.refl` -/
TheoremDoc MyLogic.Eq.refl as "Eq.refl" in "Eq"
/-- `Eq.rec` -/
TheoremDoc MyLogic.Eq.rec as "Eq.rec" in "Eq"
NewTheorem MyLogic.Eq.refl MyLogic.Eq.rec

end MyLogic

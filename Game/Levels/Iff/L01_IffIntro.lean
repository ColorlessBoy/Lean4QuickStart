import Game.MyLogic.Iff
import Game.Levels.Eq.L05_EqMpr

World "Iff"
Level 1
Title "Iff 类型"

namespace MyLogic

Introduction
"
# Iff 类型
在这一章节，我们要碰到 `lean4` 中的一个新命令 `structure`，它也是用来声明一个新类型。
读者可能会好奇，我不是说过 `inductive` 已经足够了，为什么还会有 `structure`？
答案是为了方便。你可以认为 `structure` 是一个语法糖，在 `inductive` 的基础上添加了一些新的功能。

在 lean4 中，逻辑连接符 `Iff` 类型是这样定义的：
```lean
structure Iff (a b : Prop) : Prop where
  intro ::
  mp : a -> b
  mpr : b -> a
```

本质上，它同时定义了三个函数：
- `Iff.intro : {a b : Prop} -> (a -> b) -> (b -> a) -> Iff a b`
- `Iff.mp : {a b : Prop} -> Iff a b -> a -> b`
- `Iff.mpr : {a b : Prop} -> Iff a b -> b -> a`

你可以简单地将这三个函数看成 `Iff` 类型的三个公理。
如果分开定义类型和对应公理，既繁琐又容易出错，所以 `lean4` 设计了 `structure` 将这些过程打包封装。
同时，因为从语法上能够体现这种绑定关系，lean4 的编译器也能对 `structure` 结构进行一些优化，增加运行效率。

比如，lean4 也支持这样定义 `Iff` 类型：
```lean
inductive Iff : Prop -> Prop -> Prop where
  | intro : {a b : Prop} -> (a -> b) -> (b -> a) -> Iff a b
axiom Iff.mp : {a : Prop} -> {b : Prop} -> Iff a b -> a -> b
axiom Iff.mpr : {a : Prop} -> {b : Prop} -> Iff a b -> b -> a
```
但是，如果要让编译器能够分析出这三个部分的关系并优化，编译器的具体实现将会非常复杂，得不偿失。
当然，lean4 也会自动生成公理 `Iff.rec`，就这个类型而言用处不大，我们就不展开讲了。
"

/--
基于 Iff.intro 我们可以证明它的自指性
-/
TheoremDoc MyLogic.Iff.refl as "Iff.refl" in "Iff"

Statement Iff.refl : {a : Prop} -> Iff a a := by
  intro a
  apply Iff.intro
  exact fun (h : a) => h
  exact fun (h : a) => h

Conclusion "
借助这个证明，我们可以看到 `apply` 的具体细节。
- 首先 `Iff.intro` 实际上可以证明 `{a : Prop} -> {a : Prop} -> (a -> a) -> (a -> a) -> Iff a a`；
- 观察对比目标命题，`Iff.intro` 包含两个相同的条件 `(a -> a)` 和 `(a -> a)`，`apply`会将这两个条件转化成新的目标。
"

/-- Iff 类型
```lean
inductive Iff : Prop -> Prop -> Prop where
  | intro : {a : Prop} -> {b : Prop} -> (a -> b) -> (b -> a) -> Iff a b
```
-/
DefinitionDoc Iff as "Iff"
NewDefinition Iff

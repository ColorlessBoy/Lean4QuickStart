import Game.Levels.Iff.L03_IffOfEq


World "And"
Level 1
Title "And.symm"

Introduction
"
# And 类型
And 类型也是通过 structure 来构建的
```lean
structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b
```
它本质上定义了这三个函数：
- `And.intro : (a b : Prop) -> And a b`
- `And.left : {a b : Prop} -> And a b -> a`
- `And.right : {a b : Prop} -> And a b -> b`
"
namespace MyLogic

structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b

/--
`And` 的对称性
-/
TheoremDoc MyLogic.And.symm as "And.symm" in "And"

Statement And.symm : {a b : Prop} -> And a b -> And b a := by
  Hint "请使用上述三个函数 `And.intro`, `And.left` 和 `And.right`"
  intro a b hab
  apply And.intro
  exact And.right hab
  exact And.left hab

/-- And 类型
```lean
structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b
```
-/
DefinitionDoc MyLogic.And as "And"
NewDefinition MyLogic.And
/-- `And.intro` -/
TheoremDoc MyLogic.And.intro as "And.intro" in "And"
/-- `And.left` -/
TheoremDoc MyLogic.And.left as "And.left" in "And"
/-- `And.right` -/
TheoremDoc MyLogic.And.right as "And.right" in "And"
NewTheorem MyLogic.And.intro MyLogic.And.left MyLogic.And.right

end MyLogic

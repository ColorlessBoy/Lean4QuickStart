import Game.MyLogic.And
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

Statement And.symm : {a b : Prop} -> And a b -> And b a := by
  Hint "请使用上述三个函数 `And.intro`, `And.left` 和 `And.right`"
  intro a b hab
  apply And.intro
  exact And.right hab
  exact And.left hab

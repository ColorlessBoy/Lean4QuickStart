import Game.Levels.BasicTypesAndOperations
import Game.Levels.Eq
import Game.Levels.Iff
import Game.Levels.And
import Game.Levels.Or
import Game.Levels.Not
import Game.Levels.Exists

-- Here's what we'll put on the title screen
Title "Lean4 快速入门"
Introduction
"
# Lean4 快速入门

## 目录
- 基本类型与操作
  - 凡事皆有类型和宇宙类型
  - 函数`fun (xxx : xxx) => xxx`
  - 函数类型`(xxx : xxx) -> xxx`
  - 归纳类型`inductive`
- `Eq` 类型
  - `Eq`的构造函数`Eq.refl`
  - `Eq`的循环子`Eq.rec`和对称性`Eq.symm`
  - `Eq`的的传递性`Eq.trans`
- `Iff` 类型
  - `structure`命令、`Iff`的构造函数`Iff.intro`和定理`Iff.refl`
  - `Iff.trans`
  - `Iff.of_eq`
- `And`类型：
  - `And.symm`
  - `and_assoc`
- `Or`类型：
  - `Or`的构造函数`Or.inl`和`Or.inr`和定理`Or.elim`
  - `Or.symm`
  - `or_assoc`
- `Not` 类型
  - `True` 类型和 `False` 类型
  - `absurd`
  - `not_not_intro`
"

Info "
*Game version: 0.0.1*
"

/-! Information to be displayed on the servers landing page. -/
Languages "Chinese"
CaptionShort "Lean4 快速入门"
CaptionLong "Lean4 快速入门"
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame

import Game.Levels.Not.L01_True

World "Not"
Level 2
Title "absurd"


Introduction "
# Not 类型
在 lean4 里 Not 类型像是一个函数的别名，它通过 `def` 命令声明出来
```lean
def Not (a : Prop) : Prop := a -> False
```
它表示如果命题 a 是正确的那么 `False` 将是正确的。
因为 `False` 不可能是正确的，所以 `a` 不正确。
在使用 lean4 构建数学公理体系时，
不允许出现 `False` 的构造器。如果能构造出类型为 False 的命题，那么表示这个公理体系自相矛盾。

还记得 False 的循环子吗？这道题目会用到它
```lean
recursor False.rec : (motive : False → Sort u) → (t : False) → motive t
```
lean4 可能无法推测 `False.rec` 需要用到的 motive 函数，你可以使用 `apply @False.rec fun (xxx : xxx) => xxx` 显式传入 motive 函数。
"
namespace MyLogic

def Not (a : Prop) : Prop := a → False

/--
荒谬定理
-/
TheoremDoc MyLogic.absurd as "absurd" in "Not"

Statement absurd : {a : Prop} -> {b : Sort u} -> a -> Not a -> b := by
  intro a b ha na
  apply @False.rec fun _ => b
  exact na ha

/-- Not 类型
```lean
def Not (a : Prop) : Prop := a -> False
```
-/
DefinitionDoc MyLogic.Not as "Not"
NewDefinition MyLogic.Not
end MyLogic

import Game.Levels.Eq.L01_EqRefl
import Game.Levels.Eq.L02_EqRec
import Game.Levels.Eq.L03_EqTrans
import Game.Levels.Eq.L04_EqMp
import Game.Levels.Eq.L05_EqMpr


World "Eq"
Title "Eq 类型"

Introduction
"
这个章节中，我们将学习 `Eq` 类型在 lean4 中是如何构造的。
`Eq`类型：
- `Eq`的构造函数`Eq.refl`
- `Eq`的循环子`Eq.rec`和对称性`Eq.symm`
- `Eq`的的传递性`Eq.trans`
"

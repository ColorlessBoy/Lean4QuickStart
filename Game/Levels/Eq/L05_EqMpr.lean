import Game.Levels.Eq.L04_EqMp

World "Eq"
Level 5
Title "Eq.mpr"

Introduction
"
# Eq.mpr
"

namespace MyLogic

/--
`Eq.mpr` 是 Eq 版本的 modus ponens 的逆向版本 (reverse)，即 `Eq a b -> b -> a`。
-/
TheoremDoc MyLogic.Eq.mpr as "Eq.mpr" in "Eq"

Statement Eq.mpr : {α β: Sort u} -> Eq α β -> β -> α := by
  Hint "你可以尝试使用证明过的定理 `Eq.symm` 和 `Eq.mp`。在此之前请先使用 `intro α β h` "
  intro α β h
  apply Eq.mp
  exact Eq.symm h

Conclusion "
请你一定要搞清楚 `apply Eq.mp` 和 `apply Eq.symm h` 究竟做了什么。不要因为 `apply` 强大的参数补全功能，反而迷失了内部原理，买椟还珠。
"

end MyLogic

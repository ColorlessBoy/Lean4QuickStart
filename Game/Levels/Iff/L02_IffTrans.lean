import Game.Levels.Iff.L01_Iffintro

World "Iff"
Level 2
Title "Iff 的传递性"

namespace MyLogic

/--
Iff 的传递性
-/
TheoremDoc MyLogic.Iff.trans as "Iff.trans" in "Iff"

Statement Iff.trans : {a : Prop} -> {b : Prop} -> {c : Prop} -> Iff a b -> Iff b c -> Iff a c := by
  Hint "你可以先尝试使用 `intro a b c hab hbc`"
  intro a b c hab hbc
  Hint "你可以先尝试使用 `Iff.intro`"
  apply Iff.intro
  Hint "你可以先尝试构造一个函数 `fun (xxx : xxx) => xxx`，并且使用 `Iff.mp`"
  exact fun ha => Iff.mp hbc (Iff.mp hab ha)
  Hint "你可以先尝试构造一个函数 `fun (xxx : xxx) => xxx`，并且使用 `Iff.mpr`"
  exact fun hc => Iff.mpr hab (Iff.mpr hbc hc)

namespace MyLogic

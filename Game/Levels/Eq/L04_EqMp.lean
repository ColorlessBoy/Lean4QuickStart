import Game.Levels.Eq.L03_EqTrans

World "Eq"
Level 4
Title "Eq.mp"

Introduction
"
# Eq.mp
"

namespace MyLogic

/--
`Eq.mp` 是 Eq 版本的 modus ponens，即 `Eq a b -> a -> b`。
-/
TheoremDoc MyLogic.Eq.mp as "Eq.mp" in "Eq"

Statement Eq.mp : {α β: Sort u} -> Eq α β -> α -> β := by
  Hint "`Eq.mp` 是 Eq 版本的 modus ponens, 可以输入 `\\` 加 `b` 来输入 `β`。"
  intro α
  Hint "你已经可以使用 `apply Eq.rec` 了，不需要 `intro β`"
  apply Eq.rec
  apply fun (h : α) => h

Conclusion "
证明的具体细节是：
- 使用到的是 `@Eq.rec (Sort u) α (fun {a_1 : Sort u} (_ : Eq a a_1) => α -> a_1)`；
- 它的类型是 `α -> α -> {a_1 : Sort u} -> Eq a a_1 -> α -> a_1`；
- 在 `lean4` 看来 `{a_1 : Sort u} -> Eq a a_1 -> α -> a_1` 和 `{β : Sort u} -> Eq α β -> α -> β` 是等价的；
- 所以 `apply Eq.rec` 产生新目标 `α -> α`。

希望这三个题目坐下来，你能完全理解如何使用 `Eq.rec`。

- `Eq.rec` 是和 `Eq.refl` 相对的概念。
- `Eq.refl` 是一个 **引入规则** (introduction rule)。当结论中有 `Eq` 类型时，通常会用到它。
- `Eq.rec` 是一个 **消去规则** (elimination rule)。当条件中有 `Eq` 类型时，通常会用到它。

不只是 `Eq` 类型，所有的类型都会有它的 **引入规则** 和 **消去规则**，这个结论在数理逻辑里相当深刻。
"

end MyLogic

import Game.Levels.And.L01_AndSymm


World "And"
Level 2
Title "and_assoc"
Introduction "
# And 的结合律
"

namespace MyLogic

/--
`And` 的结合律
-/
TheoremDoc MyLogic.and_assoc as "and_assoc" in "And"
Statement and_assoc : {a b c : Prop} -> Iff (And (And a b) c) (And a (And b c)) := by
  Hint "如果一个表达式是 `h : And a b`，我们可以将 `And.left h` 简化为 `h.left`。"
  intro a b c
  apply Iff.intro
  intro habc
  apply And.intro habc.left.left (And.intro habc.left.right habc.right)
  intro habc
  apply And.intro (And.intro habc.left habc.right.left) habc.right.right

end MyLogic

import Game.Levels.Or.L02_OrSymm

World "Or"
Level 3
Title "or_assoc"
Introduction "# Or 的结合律"

namespace MyLogic

/--
Or 的结合律
-/
TheoremDoc MyLogic.or_assoc as "or_assoc" in "Or"
Statement or_assoc: {a b c : Prop} -> Iff (Or (Or a b) c) (Or a (Or b c)) := by
  intro a b c
  apply Iff.intro
  apply Or.rec
  apply Or.rec
  exact Or.inl
  intro hb
  apply Or.inr (Or.inl hb)
  intro hc
  apply Or.inr (Or.inr hc)
  apply Or.rec
  intro ha
  apply Or.inl (Or.inl ha)
  apply Or.rec
  intro hb
  apply Or.inl (Or.inr hb)
  exact Or.inr

end MyLogic

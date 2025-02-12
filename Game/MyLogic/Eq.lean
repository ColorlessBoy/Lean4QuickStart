
namespace MyLogic

universe u

inductive Eq : {α : Sort u} -> α -> α -> Prop where
  | refl : (a : α) -> Eq a a

theorem Eq.symm : {α : Sort u} -> {a : α} -> {b : α} -> Eq a b -> Eq b a := by
  intro α a b
  apply Eq.rec
  apply Eq.refl

theorem Eq.trans : {α : Sort u} -> {a : α} -> {b : α} -> {c : α} -> Eq a b -> Eq b c -> Eq a c := by
  intro α a b c
  apply Eq.rec
  exact fun (h : Eq a c) => h

end MyLogic

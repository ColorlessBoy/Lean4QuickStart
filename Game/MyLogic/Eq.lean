
namespace MyLogic

universe u

inductive Eq : {α : Sort u} -> α -> α -> Prop where
  | refl : (a : α) -> Eq a a

end MyLogic

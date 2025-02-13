
namespace MyLogic

structure Iff (a b : Prop) : Prop where
  intro ::
  mp : a -> b
  mpr : b -> a

end MyLogic

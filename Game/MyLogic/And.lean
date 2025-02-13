
namespace MyLogic

structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b

end MyLogic

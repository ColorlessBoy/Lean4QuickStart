
namespace MyLogic

inductive True : Prop where
  | intro : True

inductive False : Prop

def Not (a : Prop) : Prop := a → False

end MyLogic

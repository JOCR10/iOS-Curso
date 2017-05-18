//: Playground - noun: a place where people can play

import UIKit

//variable sin inicializacion
var nameWithoutInitialization : String?

//variable con inicializacion
var nameWithInitialization = "name"

//declarar constante
let nameConstant = "name"

nameWithoutInitialization = "variable opcional"

//la manera correcta de hacer unwrap de un opcional es usando un if let
if let nameWithoutInitialization = nameWithoutInitialization {
    print("La variable tiene \(nameWithoutInitialization.characters.count) caracteres")
}

//la forma no segura no recomendada (solo si se sabe que el valor no es nil) de usar un unwrap de un opcional es la siguiente:
 print("La variable tiene \(nameWithoutInitialization!.characters.count) caracteres")

func explicacionDeUnGuard(value: String?) -> Bool{
    guard let _ = value else{
        return false
    }
    return true
}

//el guard la diferenci q tiene del let es que siempre ingresa cuando el valor es nil, y siempre necesita un return.
//El let solo ingresa cuando el valor no es nil y no necesariamente necesita un return, depende de lo que se esté realizando



enum CampoFaltante: Int
{
    case primero = 1, segundo
}

func validarCampos(campo1:String?, campo2: String?) -> CampoFaltante?
{
    guard let _ = campo1 else
    {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else
    {
        return CampoFaltante.segundo
    }
    return nil
}

validarCampos(campo1: nil, campo2: "lleno")
validarCampos(campo1: "lleno", campo2: nil)
validarCampos(campo1: nil, campo2: nil)
validarCampos(campo1: "lleno", campo2: "lleno")
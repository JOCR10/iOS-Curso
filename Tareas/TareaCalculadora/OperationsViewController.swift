//
//  ViewController.swift
//  TareaCalculadora
//
//  Created by Local User on 5/12/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class OperationsViewController: UIViewController {
    
    @IBOutlet weak var primerValorTextField: UITextField!
    
    @IBOutlet weak var segundoValorTextField: UITextField!
    
    var primerValor = 0
    var segundoValor = 0
    var resultado = 0
    var msj: String?
    var titulo: String?
    var msjValidacion = "Debe facilitar dos valores"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(OperationsViewController.CerrarKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CerrarKeyboard()  {
        view.endEditing(true)
    }
    
    @IBAction func btnSumar(_ sender: Any)
    {
        if validarCampos(campo1: primerValorTextField.text!, campo2: segundoValorTextField.text!) == true {
            
            primerValor = (Int)(primerValorTextField.text!)!
            segundoValor = (Int)(segundoValorTextField.text!)!
            
            resultado = primerValor + segundoValor
            
            msj = "El resultado de la suma es: \(resultado)"
            titulo = "Resultado"
        }
        else{
            msj = msjValidacion
            titulo = "Validar"
        }
        
        mostrarAlerta(msj: msj!, titulo: titulo!)
        
    }
    
    @IBAction func btnRestar(_ sender: Any)
    {
        if validarCampos(campo1: primerValorTextField.text!, campo2: segundoValorTextField.text!) == true {
            
            primerValor = (Int)(primerValorTextField.text!)!
            segundoValor = (Int)(segundoValorTextField.text!)!
            
            resultado = primerValor - segundoValor
            
            msj = "El resultado de la resta es: \(resultado)"
            titulo = "Resultado"
        }
        else{
            msj = msjValidacion
            titulo = "Validar"
        }
        
        mostrarAlerta(msj: msj!, titulo: titulo!)
    }
    
    @IBAction func btnDividir(_ sender: Any)
    {
        if validarCampos(campo1: primerValorTextField.text!, campo2: segundoValorTextField.text!) == true {
            
            let primerValorDiv = (Float)(primerValorTextField.text!)!
            let segundoValorDiv = (Float)(segundoValorTextField.text!)!
            
            if segundoValorDiv == 0{
                msj = "No es permitido dividir por cero!"
                titulo = "Validar"
            }
            else{
                msj = "El resultado de la división es: \(Float(primerValorDiv / segundoValorDiv))"
                titulo = "Resultado"
            }
        }
        else{
            msj = msjValidacion
            titulo = "Validar"
        }
        
        mostrarAlerta(msj: msj!, titulo: titulo!)
    }
    
    @IBAction func btnMultiplicar(_ sender: Any)
    {
        
        if validarCampos(campo1: primerValorTextField.text!, campo2: segundoValorTextField.text!) == true {
            
            primerValor = (Int)(primerValorTextField.text!)!
            segundoValor = (Int)(segundoValorTextField.text!)!
            
            resultado = primerValor * segundoValor
            
            msj = "El resultado de la multiplicación es: \(resultado)"
            titulo = "Resultado"
        }
        else{
            msj = msjValidacion
            titulo = "Validar"
        }
        
        mostrarAlerta(msj: msj!, titulo: titulo!)
    }
    
    func validarCampos(campo1:String, campo2: String) -> Bool
    {
        if campo1.characters.count == 0
        {
            return false
        }
        if campo2.characters.count == 0
        {
            return false
        }
        return true
    }
    
    func mostrarAlerta(msj: String, titulo: String){
        
        let alertController = UIAlertController(title: titulo, message: msj, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}


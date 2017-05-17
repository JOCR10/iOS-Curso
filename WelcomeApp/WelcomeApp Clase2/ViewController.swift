//
//  ViewController.swift
//  WelcomeApp Clase2
//
//  Created by Local User on 5/11/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //se definen las variables al principio por orden
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSaludar(_ sender: Any) {
//        print("el botón fue presionado")
//        let alertController = UIAlertController(title: "Informacion", message:"Usted presionó el botón", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true, completion: nil)
//        if let name = nameTextField.text
//        {
//            print("El nombre es \(name)")
//        }
        
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))! as! NameViewController
        
        nameViewController.name = nameTextField.text
        
        navigationController?.pushViewController(nameViewController, animated: true)
        
    }


}


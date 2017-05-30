//
//  AddCatViewController.swift
//  Quiz 4
//
//  Created by Local User on 5/30/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {
    
    @IBOutlet weak var nameTexField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AddCat"
        addSaveCats()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveCats()
    {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCatsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveCatsAction()
    {
        if !RealmManager.catExists(name: nameTexField.text!)
        {
            RealmManager.createCat(name: nameTexField.text!)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            mostrarAlerta(msj: "El elemento ya existe", titulo: "Atención")
        }
        
    }
    
    func mostrarAlerta(msj: String, titulo: String){
        
        let alertController = UIAlertController(title: titulo, message: msj, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}

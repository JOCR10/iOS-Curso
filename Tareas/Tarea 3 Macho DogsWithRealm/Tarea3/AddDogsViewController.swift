//
//  AddDogsViewController.swift
//  Tarea3
//
//  Created by administrator on 5/28/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import RealmSwift

class AddDogsViewController: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate{

    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textColor: UITextField!
   
    @IBOutlet weak var imageView: UIImageView!
    var imagePick = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdSaveAddButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
        
            print("Button Capture")
            imagePick.delegate = self
            imagePick.sourceType = .savedPhotosAlbum
            imagePick.allowsEditing = false
            
            self.present(imagePick, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView.image = image
            
        }
        else{
            print("Something went")
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    func createdSaveAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addSaveAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func addSaveAction()
    {
        if  textNombre.text!.isEmpty || textColor.text!.isEmpty || imageView.image == nil {
            
            let alertController = UIAlertController(title: "Información", message: "Alguno de los valores a guardar no posee información", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true)
            
        }
        else
        {
            let data = UIImagePNGRepresentation(imageView.image!) as NSData?
            
            RealmManager.createDogs(name: textNombre.text!, color: textColor.text!, data: data!)
            navigationController?.popViewController(animated: true)
            
        }
        
        
    }

}

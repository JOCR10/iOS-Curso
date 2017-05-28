//
//  AddDogViewController.swift
//  TareaDogsWithRealm
//
//  Created by Local User on 5/27/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class AddDogViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var colorTextField: UITextField!
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var dogImage: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addSaveNews()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveNews()
    {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction()
    {
        if nombreTextField.text!.characters.count > 0 && colorTextField.text!.characters.count > 0 {
            RealmManager.createDog(name: nombreTextField.text!, color: colorTextField.text!, image: dogImage!)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            
        }
    }
    
    @IBAction func examinarButton(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let imageUrl          = info[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName         = imageUrl.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let photoURL          = NSURL(fileURLWithPath: documentDirectory)
        let localPath         = photoURL.appendingPathComponent(imageName!)
        let image             = info[UIImagePickerControllerOriginalImage]as! UIImage
        let data              = UIImagePNGRepresentation(image)
        
        dogImageView.image = image
        
        do
        {
            try data?.write(to: localPath!, options: Data.WritingOptions.atomic)
            dogImage = imageName
        }
        catch
        {
            // Catch exception here and act accordingly
        }
        
        self.dismiss(animated: true, completion: nil);
    }
    
}


import UIKit

class AddDogViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var colorTextField: UITextField!
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var dogImage : NSData?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addSaveDogs()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveDogs()
    {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDogsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveDogsAction()
    {
        guard let _ = dogImage else
        {
            mostrarAlerta(msj: "Debe seleccionar una imagen", titulo: "Alerta")
            return
        }
        if nombreTextField.text!.characters.count > 0 && colorTextField.text!.characters.count > 0
        {
            CoreDataManager.createDog(name: nombreTextField.text!, color: colorTextField.text!, image: dogImage!)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            mostrarAlerta(msj: "Debe digitar el nombre y el color del perro", titulo: "Alerta")
        }
    }
    
    func mostrarAlerta(msj: String, titulo: String){
        
        let alertController = UIAlertController(title: titulo, message: msj, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func examinarButton(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image = info[UIImagePickerControllerOriginalImage]as! UIImage
        dogImageView.image = image
        dogImage = UIImagePNGRepresentation(image) as NSData?
        self.dismiss(animated: true, completion: nil);
    }
    
}

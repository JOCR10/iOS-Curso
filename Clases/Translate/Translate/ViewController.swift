//
//  ViewController.swift
//  Translate
//
//  Created by Local User on 5/30/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    
    @IBOutlet weak var destinoLabel: UILabel!
    @IBOutlet weak var origenLabel: UILabel!
    @IBOutlet weak var destinationText: UITextView!
    @IBOutlet weak var originText: UITextView!
    
    var originLanguage: String?
    var destinationLanguage: String?
    
    var languagesArray : [[String: String]]?
    
    @IBAction func translateAccion(_ sender: Any) {
        guard let originLanguage = originLanguage else
        {
            mostrarAlerta(msj: "Por favor indicar lenguage origen", titulo: "Alerta")
            return
        }
        guard let destinationLanguage = destinationLanguage else
        {
            mostrarAlerta(msj: "Por favor indicar lenguage destino", titulo: "Alerta")
            return
        }
        if (originText.text.isEmptyOrWhiteSpace())
        {
            mostrarAlerta(msj: "Por favor escribir el texto a traducir", titulo: "Alerta")
        }
        else{
            showActivityIndicator()
            APIManager.createTranslate(originLanguage: originLanguage, destinationLanguage: destinationLanguage, textToTranslate: originText.text, completion: { (textToTranslate) in
                guard let textToTranslate =  textToTranslate else
                {
                    self.mostrarAlerta(msj: "Se ha producido un error", titulo: "Alerta")
                    self.hideActivityIndicator()
                    return
                }
                self.destinationText.text = textToTranslate
                self.hideActivityIndicator()
            })
            
        }
    }
    
    @IBAction func cambioAction(_ sender: Any) {
        let backUp = originLanguage
        originLanguage = destinationLanguage
        destinationLanguage = backUp
        updateLanguagesLabel()
    }
    
    @IBAction func destinoAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.destination)
    }
    
    @IBAction func origenAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.origin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        showActivityIndicator()
        APIManager.getLanguages()
        
    }
    
    func registerNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector (getLanguagesAvailable(notification:)), name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (showError(notification:)), name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    func getLanguagesAvailable(notification: Notification)
    {
        languagesArray = notification.userInfo![Constants.LANGUAGE_KEY] as? [[String: String]]
        hideActivityIndicator()
    }
    
    func showError(notification: Notification)
    {
        hideActivityIndicator()
        mostrarAlerta(msj: "Ha ocurrido un error", titulo: "Atención")
    }
    
    func mostrarAlerta(msj: String, titulo: String){
        
        let alertController = UIAlertController(title: titulo, message: msj, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showActivityIndicator()
    {
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.squareSpin)
        }
    }
    
    func hideActivityIndicator()
    {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    
    func presentLanguageController(languageType: Constants.LanguageType)
    {
        if let _ = languagesArray{
            let languageViewController = storyboard?.instantiateViewController(withIdentifier: "LanguagesViewController") as! LanguagesViewController
            languageViewController.modalPresentationStyle = .overCurrentContext
            languageViewController.delegate = self
            languageViewController.languageType = languageType
            languageViewController.languagesArray = languagesArray!
            present(languageViewController, animated: true, completion: nil)
        }
        else
        {
            mostrarAlerta(msj: "Los lenguajes no han sido cargados", titulo: "Alerta")
        }
    }
    
    func updateLanguagesLabel()
    {
        origenLabel.text = originLanguage?.uppercased()
        destinoLabel.text = destinationLanguage?.uppercased()
    }
    
}

extension ViewController: LanguagesViewControllerDelegate
{
    func closePopOver() {
        dismiss(animated: true, completion: nil)
    }
    
    func selectLanguage(languageType : Constants.LanguageType, language: String)
    {
        switch languageType {
        case .origin:
            originLanguage = language
        case .destination:
            destinationLanguage = language
        }
        
        updateLanguagesLabel()
        closePopOver()
    }
}

extension String
{
    func isEmptyOrWhiteSpace() -> Bool
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty
    }
}


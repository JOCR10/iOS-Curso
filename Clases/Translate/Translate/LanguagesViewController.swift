//
//  LanguagesViewController.swift
//  Translate
//
//  Created by Local User on 6/1/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

protocol LanguagesViewControllerDelegate: class {
    
    func closePopOver()
    func selectLanguage(languageType : Constants.LanguageType, language: String)
}

class LanguagesViewController: UIViewController {

    weak var delegate : LanguagesViewControllerDelegate?
    var languageType : Constants.LanguageType?
    var languagesArray = [[String:String]]()
    @IBOutlet weak var pickerView: UIPickerView!

    
    @IBAction func seleccionarAccion(_ sender: Any) {
        
        let languageSelected = languagesArray[pickerView.selectedRow(inComponent: 0)]
        delegate?.selectLanguage(languageType: languageType!, language: languageSelected[Constants.DIRS_KEY]!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row][Constants.LANGUAGE_KEY]
    }
}

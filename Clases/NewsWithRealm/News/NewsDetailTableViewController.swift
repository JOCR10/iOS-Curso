//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Local User on 5/23/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift

class NewsDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var textFieldName: UITextField!
    
    var categoryType = 0
    
    override func viewDidLoad() {
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
        RealmManager.createNews(categoryType: categoryType, title: textFieldName.text!, description: textViewDescription.text!)
        navigationController?.popViewController(animated: true)
    }
}

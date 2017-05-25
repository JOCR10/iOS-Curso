//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Local User on 5/23/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

protocol NewsDetailTableViewControllerDelegate: class {
    
    func addNews(news : News)
}

class NewsDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var textFieldName: UITextField!
    
    weak var delegate : NewsDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveNews()
    {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction()
    {
//        let news = News(titleNews: textFieldName.text!, descriptionNews: textViewDescription.text!, createdAt: Date())
//        delegate?.addNews(news: news)
        navigationController?.popViewController(animated: true)
    }
}

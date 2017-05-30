//
//  ViewController.swift
//  Quiz 4
//
//  Created by Local User on 5/30/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift


class CatListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cats : Results<Cat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        createdAddButton()
        tableView.registerCustomCell(identifier: CatCustomTableViewCell.getTableViewCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeCats()
        tableView.reloadData()
    }
    
    func initializeCats()
    {
        cats = RealmManager.getAllCats()
    }
    
    func createdAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction()
    {
        
        let addCatViewController = storyboard!.instantiateViewController(withIdentifier: AddCatViewController.getViewControllerIdentifier())
        navigationController?.pushViewController(addCatViewController, animated: true)
    }
}

extension CatListViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let cats = cats else
        {
            return 0
        }
        
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = (tableView.dequeueReusableCell(withIdentifier: CatCustomTableViewCell.getTableViewCellIdentifier())) as! CatCustomTableViewCell
        let cat = cats![indexPath.row]
        cell.setUpCell(cat:  cat)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


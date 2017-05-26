//
//  CategoryViewController.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories : Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        initializeCategories()
        self.title = "Categorías"
    }
    
    func initializeCategories() {
        categories = RealmManager.getAllCategories()
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let categories = categories else
        {
            return 0
        }
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifier()) as! NewsViewController
        newsViewController.titleCategory = categories![indexPath.row].name
        newsViewController.categoryType = categories![indexPath.row].type
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = (tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getTableViewCellIdentifier())) as! CategoryTableViewCell
        let category = categories![indexPath.row]
        cell.setUpCell(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
}

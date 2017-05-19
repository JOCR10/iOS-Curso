//
//  CategoryViewController.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        initializeCategories()
        self.title = "Categorías"
    }
    
    func initializeCategories() {
        
        let economyCategory = Category(name: "Economía", image: "economy")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        let sportsCategory = Category(name: "Deportes", image: "sports")
        let technologyCategory = Category(name: "Tecnología", image: "technology")
        
        categories = [economyCategory, incidentCategory, sportsCategory, technologyCategory]
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifier()) as! NewsViewController
        newsViewController.news = categories[indexPath.row].newsArray
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getTableViewCellIdentifier())) as! CategoryTableViewCell
        let category = categories[indexPath.row]
        cell.setUpCell(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

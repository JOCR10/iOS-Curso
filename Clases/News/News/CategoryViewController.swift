//
//  CategoryViewController.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate: class {
    
    func addNews(news : News)
}

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories = [Category]()
    
    weak var delegate: CategoryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        initializeCategories()
        self.title = "Categorías"
    }
    
    func initializeCategories() {
        
        let economyCategory = Category(name: "Economía", image: "economy", type: CategoryType.economy)
        let incidentCategory = Category(name: "Sucesos", image: "incident" , type: CategoryType.incidents)
        let sportsCategory = Category(name: "Deportes", image: "sports", type: CategoryType.sports)
        let technologyCategory = Category(name: "Tecnología", image: "technology", type: CategoryType.technology)
        
        categories = [economyCategory, incidentCategory, sportsCategory, technologyCategory]
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifier()) as! NewsViewController
        newsViewController.newsArray = categories[indexPath.row].newsArray
        newsViewController.titleCategory = categories[indexPath.row].name
        newsViewController.categoryType = categories[indexPath.row].type
        newsViewController.delegate = self
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

extension CategoryViewController: NewsViewControllerDelegate
{
    func addNews(news: [News], type: CategoryType)
    {
        let index = categories.index{$0.type == type }
        if let indexUnwraped = index
        {
            let categoryToUpdate = categories[indexUnwraped]
            categoryToUpdate.newsArray = news
            categories[indexUnwraped] = categoryToUpdate
        }
    }
}

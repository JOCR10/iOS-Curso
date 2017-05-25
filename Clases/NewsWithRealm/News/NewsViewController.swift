//
//  NewsViewController.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

protocol NewsViewControllerDelegate: class {
    
//    func addNews(news: [News], type: CategoryType)
}

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    weak var delegate: NewsViewControllerDelegate?
    
    var newsArray: [News]?
//    var categoryType: CategoryType?
    var titleCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.registerCustomCell(identifier: NewsTableViewCell.getTableViewCellIdentifier())
        self.title = titleCategory!
        createdAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if let newsArray = newsArray, let categoryType = categoryType
//        {
//            delegate?.addNews(news : newsArray, type: categoryType)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createdAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        
        let newsDetailViewController = storyboard!.instantiateViewController(withIdentifier: NewsDetailTableViewController.getViewControllerIdentifier()) as! NewsDetailTableViewController
        newsDetailViewController.delegate = self
        navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let newsArray = newsArray else{
            return 0
        }
        
        return newsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getTableViewCellIdentifier())) as! NewsTableViewCell
        let new = newsArray![indexPath.row]
        cell.setUpCell(news: new)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension NewsViewController: NewsDetailTableViewControllerDelegate
{
    func addNews(news: News) {
        newsArray?.append(news)
        newsTableView.reloadData()
    }
}

//
//  NewsViewController.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    var news: [News]?
    var titleCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.registerCustomCell(identifier: NewsTableViewCell.getTableViewCellIdentifier())
        self.title = titleCategory!
        createdAddButto()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createdAddButto(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        
    
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else{
            return 0
        }
        
        return news.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifier()) as! NewsViewController
        //        newsViewController.news = categories[indexPath.row].newsArray
        //        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getTableViewCellIdentifier())) as! NewsTableViewCell
        let new = news![indexPath.row]
        cell.setUpCell(news: new)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

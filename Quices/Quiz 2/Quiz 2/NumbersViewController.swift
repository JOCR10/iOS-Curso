//
//  NumbersViewController.swift
//  Quiz 2
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbers=getArray()
        tableView.registerCustomCell(identifier: NumberTableViewCell.getCellIdentifier())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getArray () -> [Int]
    {
        var array = [Int]()
        for index in 1..<100
        {
            array.append(index)
        }
        return array
    }
}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.getCellIdentifier()) as! NumberTableViewCell
        
        let value = numbers[indexPath.row]
        cell.numberLabel?.text = "\(value)"
        
        if value % 2 == 0 {
            cell.backgroundColor = UIColor.red
        }
        else
        {
            cell.backgroundColor = UIColor.blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}

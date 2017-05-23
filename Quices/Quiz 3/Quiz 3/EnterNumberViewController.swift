//
//  EnterNumberViewController.swift
//  Quiz 3
//
//  Created by Local User on 5/23/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldValue: UITextField!
    
    var numbers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NumberCustomCell.getCellIdentifier())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func buttonAction(_ sender: Any) {
        
        if((textFieldValue.text?.characters.count)! > 0 )
        {
            numbers.append(textFieldValue.text!)
            tableView.reloadData()
        }
    }
    
}

extension EnterNumberViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell.getCellIdentifier()) as! NumberCustomCell
        
        let value = numbers[indexPath.row]
        cell.labelText?.text = "\(value)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
}

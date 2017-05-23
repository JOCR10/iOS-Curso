//
//  PrimosViewController.swift
//  TareaNumerosPrimos
//
//  Created by Local User on 5/22/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class PrimosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var numerosPrimos = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numerosPrimos = initializeArray()
        tableView.registerCustomCell(identifier: NumeroPrimoTableViewCell.getCellIdentifier())
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeArray()-> [Int]{
        var array = [Int]()
        for index in 1...1000 {
            if index == 1 || !(2..<index).contains { index % $0 == 0 }
            {
                array.append(index)
            }
        }
        return array
    }
    
}

extension PrimosViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numerosPrimos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: NumeroPrimoTableViewCell.getCellIdentifier()) as! NumeroPrimoTableViewCell
        
        let value = numerosPrimos[indexPath.row]
        cell.primoLabel?.text = "\(value)"
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
}

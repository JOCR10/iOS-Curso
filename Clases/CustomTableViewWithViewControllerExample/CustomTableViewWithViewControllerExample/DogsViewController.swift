//
//  DogsViewController.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by Local User on 5/16/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    var dogs = [Dog]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDogArray()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIdentifier())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeDogArray(){
        let dog1 = Dog(name: "Pipo", age: "27 años", color: "Blanco")
        let dog2 = Dog(name: "Tony", age: "26 años", color: "Negro")
        let dog3 = Dog(name: "Sensei", age: "31 años", color: "Rosa")
        let dog4 = Dog(name: "Macho", age: "27 años", color: "Rojo")
        let dog5 = Dog(name: "Dieguin", age: "29 años", color: "Morado")
        dogs = [dog1,dog2,dog3,dog4,dog5]
    }
}


extension DogsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIdentifier()) as! DogTableViewCell
        
        let dog = dogs[indexPath.row]
        
        cell.nameLabel.text = (dog.name )
        cell.colorLabel.text = (dog.color )
        cell.ageLabel.text = (dog.age)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

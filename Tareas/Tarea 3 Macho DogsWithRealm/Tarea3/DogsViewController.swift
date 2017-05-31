//
//  DogsViewController.swift
//  Tarea3
//
//  Created by administrator on 5/28/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import RealmSwift

class DogsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   var dogs: Results<Dogs>?

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.registerCustomCell(identifier: DogTableViewCelleTableViewCell.getTableViewCellIdentifier())
        createdAddButton()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
          inicializarArray()
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializarArray(){
        
        dogs = RealmManager.getAllDogs()
        
    }
    
    func createdAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func addAction()
    {
        
        let addDogsViewController = storyboard!.instantiateViewController(withIdentifier: AddDogsViewController.getViewControllerIdentifier()) as! AddDogsViewController
        navigationController?.pushViewController(addDogsViewController, animated: true)
    }
    

}


extension DogsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: DogTableViewCelleTableViewCell.getTableViewCellIdentifier())) as! DogTableViewCelleTableViewCell
        let dog = dogs![indexPath.row]
        cell.setUpCell(dogs: dog)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dogs = dogs else{
            return 0
        }
        
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}


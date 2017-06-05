//
//  DogsViewController.swift
//  TareaDogsWithRealm
//
//  Created by Local User on 5/27/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //var dogs : Results<Dog>?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: DogTableViewCell.getTableViewCellIdentifier())
        createdAddButton()
        self.title = "Perros"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeDogs()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func initializeDogs()
    {
        //dogs = RealmManager.getAllDogs()
    }
    
    func createdAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction()
    {
        
        let addDogViewController = storyboard!.instantiateViewController(withIdentifier: AddDogViewController.getViewControllerIdentifier())
        navigationController?.pushViewController(addDogViewController, animated: true)
    }

}

extension DogsViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        guard let dogs = dogs else
//        {
//            return 0
//        }
        
        return 1 //dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = (tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getTableViewCellIdentifier())) as! DogTableViewCell
        //let dog = dogs![indexPath.row]
        //cell.setUpCell(dog:  dog)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

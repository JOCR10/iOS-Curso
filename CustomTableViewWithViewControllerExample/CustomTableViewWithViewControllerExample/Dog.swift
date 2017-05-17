//
//  Dog.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by Local User on 5/16/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class Dog: NSObject {
    
    var name: String
    var color: String
    var age: String
    
    init (name: String, age: String, color: String){
        self.name = name
        self.color = color
        self.age = age
    }    
}

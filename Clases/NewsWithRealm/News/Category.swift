//
//  Category.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

enum CategoryType
{
    case economy, sports, incidents, technology
}

class Category: NSObject {
    
    var name: String
    var image: UIImage
    var newsArray: [News]
    var type: CategoryType
    
    init(name: String, image: String, type: CategoryType) {
        self.name = name
        self.image = UIImage(named: image)!
        self.type = type
        self.newsArray = [News]()
    }
}

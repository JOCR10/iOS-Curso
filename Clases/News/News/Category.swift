//
//  Category.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name: String
    var image: UIImage
    var newsArray: [News]
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
        self.newsArray = [News]()
    }
}

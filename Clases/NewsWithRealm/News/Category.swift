//
//  Category.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift

class Category: Object {
    
    dynamic var name = ""
    dynamic var imageName = ""
    let news = List<News>()
    dynamic var type = 0
}

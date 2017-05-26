//
//  News.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift


class News: Object {
    
    dynamic var titleNews = ""
    dynamic var descriptionNews = ""
    dynamic var createdAt = Date()
    dynamic var category: Category?
    
}

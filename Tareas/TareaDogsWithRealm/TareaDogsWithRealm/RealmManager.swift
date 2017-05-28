//
//  RealmManager.swift
//  News
//
//  Created by Local User on 5/25/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllDogs() -> Results<Dog>?
    {
        let realm = try! Realm()
        let dogs = realm.objects(Dog.self)
        if dogs.count > 0
        {
            return dogs
        }
        return nil
    }
    
    private class func addObjectToRealm(realmObject: Object)
    {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    //    private class func getCategory(type: Int ) -> Category
    //    {
    //        let realm = try! Realm()
    //        let predicate = NSPredicate(format: "type = %d", type)
    //        return realm.objects(Category.self).filter(predicate).first!
    //    }
    
    //    class func getAllNews(categoryType : Int) -> List<News>?
    //    {
    //        return getCategory(type: categoryType).news
    //    }
    
    class func createDog(name: String, color: String, image: String )
    {
        let dog = Dog()
        dog.name = name
        dog.color = color
        dog.imageName = image
        addObjectToRealm(realmObject: dog)
    }
    
}

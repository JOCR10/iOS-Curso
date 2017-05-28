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
            return dogs.sorted(byKeyPath: "orden", ascending: false)
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
    
    class func createDog(name: String, color: String, image: String )
    {
        let dog = Dog()
        var orden = 1
        dog.name = name
        dog.color = color
        dog.imageName = image
        if let dogs = getAllDogs()
        {
            orden = dogs.count + 1
        }
        dog.orden = orden
        addObjectToRealm(realmObject: dog)
    }
    
}

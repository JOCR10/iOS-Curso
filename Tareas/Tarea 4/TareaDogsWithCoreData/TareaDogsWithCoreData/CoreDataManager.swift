

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllDogs() -> [Dog]?
    {
        let result = Dog.mr_findAll()
        if result!.count > 0 {
            return (result as! [Dog]).sorted{($0.orden?.intValue)! > ($1.orden?.intValue)!}
        }
        return nil
    }
    
    private class func saveContext()
    {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    class func createDog(name: String, color: String, image: NSData)
    {
        let dog = Dog.mr_createEntity()
        var orden = 1
        dog?.name = name
        dog?.color = color
        dog?.image = image
        if let dogs = getAllDogs()
        {
            orden = dogs.count + 1
        }
        dog?.orden = orden as NSNumber
        saveContext()
    }
    
}


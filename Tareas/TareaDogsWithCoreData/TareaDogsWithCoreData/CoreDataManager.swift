

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllDogs() -> [Dog]?
    {
        let result = Dog.mr_findAll()
        if result!.count > 0 {
            return (result as! [Dog])
        }
        return nil
    }
    
//    class func createDefaultsCategory() -> [Category]
//    {
////        createCategory(name: "Economia", imageName: "economy")
////        createCategory(name: "Deportes", imazageName: "sports")
////        createCategory(name: "Sucesos", imageName: "incident")
////        createCategory(name: "Tecnologia", imageName: "technology")
////        saveContext()
////        return getAllCategories()
//        
//    }
    
    private class func createCategory(name : String, imageName : String)
    {
        //let category = Category.mr_createEntity()
//        category?.name = name
//        category?.imageName = imageName
    }
    
    private class func saveContext()
    {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    class func createDogs(dog : Category, descriptionNews : String, title : String)
    {
        
//        let news = Dog.mr_createEntity()
//        news?.descriptionNews = descriptionNews
//        news?.title = title
//        news?.createdAt = Date()
//        news?.category = category
        //category.addNewsObject(news!)
        saveContext()
    }
    
}


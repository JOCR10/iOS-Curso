//
//  CoreDataManager.swift
//  News
//
//  Created by Local User on 5/30/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllCategories() -> [Category]
    {
        let result = Category.mr_findAll()
        if result!.count == 0 {
            return createDefaultsCategory()
        }
        return result as! [Category]
        
    }
    
    class func createDefaultsCategory() -> [Category]
    {
        createCategory(name: "Economia", imageName: "economy")
        createCategory(name: "Deportes", imageName: "sports")
        createCategory(name: "Sucesos", imageName: "incident")
        createCategory(name: "Tecnologia", imageName: "technology")
        saveContext()
        return getAllCategories()
        
    }
    
    private class func createCategory(name : String, imageName : String)
    {
        let category = Category.mr_createEntity()
        category?.name = name
        category?.imageName = imageName
    }
    
    private class func saveContext()
    {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    class func createNews(category : Category, descriptionNews : String, title : String)
    {
        
        let news = News.mr_createEntity()
        news?.descriptionNews = descriptionNews
        news?.title = title
        news?.createdAt = Date()
        //news?.category = category
        category.addNewsObject(news!)
    }
    
}


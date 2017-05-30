import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllCats() -> Results<Cat>?
    {
        let realm = try! Realm()
        let cats = realm.objects(Cat.self)
        if cats.count > 0
        {
            return cats
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
    
    class func createCat(name: String)
    {
        let cat = Cat()
        cat.name = name
        addObjectToRealm(realmObject: cat)
    }
    
    private class func getCat(name: String ) -> Cat?
    {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "name = %@", name)
        return realm.objects(Cat.self).filter(predicate).first
    }
    
    class func catExists(name : String) -> Bool
    {
        if let _ = getCat(name: name)
        {
            return true
        }
        
        return false
    }
    
}

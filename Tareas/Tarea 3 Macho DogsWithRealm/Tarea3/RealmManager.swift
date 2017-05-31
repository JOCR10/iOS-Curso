import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllDogs() -> Results<Dogs>? {
        let realm = try! Realm()
        let dogs = realm.objects(Dogs.self)
        if dogs.count > 0 {
            return dogs.sorted(byKeyPath: "order", ascending: false)
        }
        else {
            return nil
        }
    }
    
    class func createDogs(name: String, color: String, data : NSData) {
        
        var idOrder = 1
       
        let dogs = Dogs()
        dogs.name = name
        dogs.color = color
        dogs.imageName = data
        
        if let dogs = getAllDogs(){
            idOrder = dogs.count + 1
        
        }
        
        dogs.order = idOrder
            
            
        addObjectToRealm(realmObject: dogs)
        
    }

    
    private class func addObjectToRealm(realmObject: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
}

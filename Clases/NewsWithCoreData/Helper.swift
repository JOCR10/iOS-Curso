import UIKit

extension UIViewController{
    
    class func getViewControllerIdentifier() -> String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    
    class func getTableViewCellIdentifier() -> String {
        return String(describing: self)
    }
    
}

extension UITableView{
    func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

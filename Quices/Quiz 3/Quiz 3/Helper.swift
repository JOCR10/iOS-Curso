
import Foundation

import UIKit

extension UITableView{
    
    func registerCustomCell(identifier: String)  {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension UITableViewCell{
    
    class func getCellIdentifier() -> String {
        return String(describing: self)
    }
    
}

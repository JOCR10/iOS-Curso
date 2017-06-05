//
//  Helper.swift
//  TareaNumerosPrimos
//
//  Created by Local User on 5/22/17.
//  Copyright © 2017 Local User. All rights reserved.
//

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

//
//  DogTableViewCelleTableViewCell.swift
//  Tarea3
//
//  Created by administrator on 5/28/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class DogTableViewCelleTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtNombre: UILabel!
    @IBOutlet weak var txtColor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(dogs: Dogs) {
        txtNombre.text = dogs.name
        txtColor.text = dogs.color
        let image : UIImage = UIImage(data: dogs.imageName as Data)!
        
       imgView.image = image
        
    }
    
}

//
//  CategoryTableViewCell.swift
//  News
//
//  Created by Local User on 5/18/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(category: Category)
    {
        categoryImageView.image = UIImage(named: category.imageName)
        nameLabel.text = category.name
    }
    
}

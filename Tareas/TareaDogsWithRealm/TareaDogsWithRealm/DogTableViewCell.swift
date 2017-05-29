//
//  DogTableViewCell.swift
//  TareaDogsWithRealm
//
//  Created by Local User on 5/27/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit


class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(dog: Dog)
    {
        colorLabel.text = dog.color
        nameLabel.text = dog.name
        dogImageView.image = UIImage(contentsOfFile: dog.imageName)
//        saveImageDocumentDirectory(imageName: dog.imageName)
//        getImage(imageName: dog.imageName)
    }
    
    func saveImageDocumentDirectory(imageName : String)
    {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = UIImage(contentsOfFile: imageName)
        print(paths)
        let imageData = UIImageJPEGRepresentation(image!, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func getDirectoryPath() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getImage(imageName : String)
    {
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePAth){
            self.dogImageView.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }
    }
}

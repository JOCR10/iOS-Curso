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
        
        dogImageView.image = loadImage(imageName: dog.imageName)
    }
    
    func fileInDocumentsDirectory(_ filename: String) -> String {
        
        let fileURL = getDocumentsURL().appendingPathComponent(filename)
        return fileURL.path
        
    }
    
    func getDocumentsURL() -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsURL
    }
    
    func loadImage(imageName : String) -> UIImage? {
        
        // Get the image back
        let imageName:String = imageName  // Or whatever name you saved
        let imagePath = fileInDocumentsDirectory(imageName)
        
        if let loadedImage = self.loadImageFromPath(imagePath) {
            return loadedImage
        } else {
            print("Couldn't Load: \(imageName)")
            return nil
        }
        
    }
    
    func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("couldn't find image at path: \(path)")
        }
        
        return image
    }
}

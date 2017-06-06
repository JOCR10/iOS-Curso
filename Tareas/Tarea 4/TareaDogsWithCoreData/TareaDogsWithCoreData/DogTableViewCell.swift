

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
        let newImage = UIImage(data: dog.image! as Data)
        dogImageView.image = newImage

    }
}

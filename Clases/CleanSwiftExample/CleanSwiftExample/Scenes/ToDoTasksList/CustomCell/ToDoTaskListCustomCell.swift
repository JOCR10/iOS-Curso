//
//  ToDoTaskListCustomCell.swift
//  CleanSwiftExample
//
//  Created by Local User on 6/6/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

class ToDoTaskListCustomCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelCounter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(task: ToDoTasksList.TaskModelCell) {
        labelText.text = task.text
        labelCounter.text = task.counter
    }
    
}

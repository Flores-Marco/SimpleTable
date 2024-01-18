//
//  TaskViewCell.swift
//  SimpleTable
//
//  Created by Marco Antonio Flores Perez on 17/01/24.
//

import UIKit

//protocol TaskViewCellDelegate: AnyObject {
//    func editPressed(cell: TaskViewCell)
//    func deletePressed(cell: TaskViewCell)
//}

class TaskViewCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let taskManager = TaskManager.shared
    var index: Int = 0
    
//    weak var delegate: TaskViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func editButtonPressed(_ sender: Any) {
//        delegate?.editPressed(cell: self)
//    }
//
//
//    @IBAction func deleteButtonPressed(_ sender: Any) {
//        delegate?.deletePressed(cell: self)
//    }
}

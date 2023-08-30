//
//  DoneTableViewCell.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/28.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

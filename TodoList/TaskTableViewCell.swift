//
//  TaskTableViewCell.swift
//  TodoList
//
//  Created by MinhNV on 5/9/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtCell: UILabel!
    
    func setTask(task: String) {
        txtCell.text = task
    }
    
}

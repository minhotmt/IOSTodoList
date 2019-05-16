//
//  UpdateTaskViewController.swift
//  TodoList
//
//  Created by MinhNV on 5/13/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class UpdateTaskViewController: UIViewController {
    
    var txtTask: String = ""
    var id: Int?
    var delegateUpdate: UpdateTask?

    @IBOutlet weak var txtUpdate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUpdate.text = txtTask
    }
    
    @IBAction func UpdateTask(_ sender: Any) {
    
        if delegateUpdate != nil {
            print("Call update")
            delegateUpdate?.updateTask(id: id!, name: txtUpdate.text!)
        }
    }
}

protocol UpdateTask {
    func updateTask(id: Int, name:String)
}

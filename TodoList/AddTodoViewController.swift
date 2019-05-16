//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by MinhNV on 5/9/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    var delegate: AddTaskListen?
    var txtName: String = ""

    @IBOutlet weak var txtTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtTask.text = txtName
    }
    
    @IBAction func AddTask(_ sender: Any) {
        print("Call add 1")
        if txtTask.text?.isEmpty ?? true {
            print("Input Empty")
        } else  {
            if delegate != nil
            {
                print("Call add 2")
                delegate?.addTask(nameTask: txtTask.text!)
                txtTask.text = nil
                
                
                let yes = UIAlertAction(title: "OK", style: .destructive) { _ in
                    self.dismiss(animated: true, completion: nil)
                }
          
                let alertController = UIAlertController(
                    title: "Thành công",
                    message: "Đã thêm task thành công",
                    preferredStyle: .alert
                )
                alertController.addAction(yes)
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }

}

protocol AddTaskListen {
    func addTask(nameTask: String)
}

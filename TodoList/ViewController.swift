//
//  ViewController.swift
//  TodoList
//
//  Created by MinhNV on 5/9/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddTaskListen, UpdateTask {
    
    func updateTask(id: Int, name: String) {
        print("Update")
        //        listTask[id].nameTask = name
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
        
    }
    
    
    @IBOutlet weak var txtCancel: UIBarButtonItem!
    func addTask(nameTask: String) {
        addNewTask(nameTask: nameTask)
    }
    
    @IBAction func EditTableView(_ sender: Any) {
        tableView.isEditing = true
        txtCancel.title = "Cancel"
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "UpdateTask" {
            print("run here 2")
            let vcUpdate : UpdateTaskViewController = segue.destination as! UpdateTaskViewController
            vcUpdate.delegateUpdate = self
        }
        
        if segue.identifier == "sangman" {
            print("run here 1")
            let vc : AddTodoViewController = segue.destination as! AddTodoViewController
            vc.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    var listTask: [Task]	= []
    @IBOutlet weak var txtNewTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listTask = createTasks()
        txtCancel.title = ""
    }
    
    @IBAction func CancelEdit(_ sender: Any) {
        tableView.isEditing = false
        txtCancel.title = ""
    }
    func createTasks() -> [Task] {
        var listTask: [Task] = []
        let task1 = Task(nameTask: "Learn Android")
        let task2 = Task(nameTask: "Learn IOS")
        let task3 = Task(nameTask: "Learn Java")
        let task4 = Task(nameTask: "Learn Swift")
        listTask.append(task1)
        listTask.append(task2)
        listTask.append(task3)
        listTask.append(task4)
        return listTask
    }
    @IBAction func AddTask(_ sender: Any) {
        if txtNewTask.text?.isEmpty ?? true {
            print("Input Empty")
        } else {
            addNewTask(nameTask: txtNewTask.text!)
            txtNewTask.text = nil
        }
    }
    
    func addNewTask(nameTask: String){
        let task = Task(nameTask: nameTask)
        listTask.append(task)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: listTask.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    @IBAction func AddTaskNew(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddTask")
        self.present(controller, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = listTask[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        cell.setTask(task: task.nameTask)
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.listTask.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = listTask[sourceIndexPath.row]
        listTask.remove(at: sourceIndexPath.row)
        listTask.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
                let vc2 = storyboard?.instantiateViewController(withIdentifier: "UpdateTask") as? UpdateTaskViewController
                vc2?.txtTask = listTask[indexPath.row].nameTask
                vc2?.id = indexPath.row
                self.navigationController?.pushViewController(vc2!, animated: true)
    }
}



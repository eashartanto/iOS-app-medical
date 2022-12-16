//
//  ViewController.swift
//  ToDoList
//
//  Created by Tati on 12/15/22.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {


    //empty array where reminders will be appended
    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        //append objects upon first load
        tasks.append(Task(name: "Daily Meeting with the team"))
        tasks.append(Task(name: "Completing the prototype"))
        tasks.append(Task(name: "Find people for the user test"))
        tasks.append(Task(name: "Buy cookies for the kids"))
        tasks.append(Task(name: "Pay electricity bill"))
        
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows depends on tasks in array
        return tasks.count
            
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: IndexPath) as! TaskCell
            //typecast to the class created for the cell inside the table
        
        //getting name from array and making it equal to taskNameLabel in the table
        //iterate through as many as there are
        cell.taskNameLabel.text = tasks[IndexPath.row].name
        
        //check if checked
        if tasks[IndexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(UIImage(systemName: "outline"), for: UIControl.State.normal)
            
        } else {
            cell.checkBoxOutlet.setBackgroundImage(UIImage(systemName: "filled"), for: UIControl.State.normal)
        }
        
        
        
        cell.delegate = self
        cell.indexP = IndexPath.row
        cell.tasks = tasks
        return cell
            
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    
    
    //connect to the protocol declared in the other VC
    func addTask(name: String) {
        tasks.append(Task(name: name))
        //reload once the task is added
        tableView.reloadData()
    }
    
    func changeButton(checked: Bool, index: Int?) {
        tasks[index!].checked = checked
        tableView.reloadData()
    }

    
}

class Task {
    var name = ""
    var checked = false
    
    convenience init(name: String) {
        self.init()
        self.name = name
        
    }
}

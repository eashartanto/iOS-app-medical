//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Tati on 12/16/22.
//

import UIKit

protocol AddTask {
    
    func addTask(name: String)
}


class AddTaskController: UIViewController {

    @IBOutlet weak var taskNameOutlet: UITextField!
    
    @IBAction func addAction(_ sender: Any) {
        
        //take user input send it to the array
        if taskNameOutlet.text != "" {
            delegate?.addTask(name: taskNameOutlet.text!)
            //return to list screen upon adding new
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    var delegate: AddTask?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

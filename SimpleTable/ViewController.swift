//
//  ViewController.swift
//  SimpleTable
//
//  Created by Marco Antonio Flores Perez on 17/01/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let taskManager = TaskManager.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskManager.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.taskViewCell) as? TaskViewCell {
            let task = taskManager.tasks[indexPath.row]
            
            cell.delegate = self
            cell.nameLabel.text = task.firstName + " " + task.lastName
            cell.emailLabel.text = task.email
            cell.index = indexPath.row
            
            return cell
        }
        return UITableViewCell()
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskManager.tasks = K.tasksExample
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.registerTableViewCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func registerTableViewCells() {
        let taskViewCell = UINib(nibName: K.Identifiers.taskViewCell, bundle: nil)
        self.tableView.register(taskViewCell, forCellReuseIdentifier: K.Identifiers.taskViewCell)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Identifiers.editToTaskView {
            if let destinationVC = segue.destination as? TaskViewController,
               let cell = sender as? TaskViewCell,
               let indexPath = tableView.indexPath(for: cell){
                destinationVC.index = indexPath.row
                let name = cell.nameLabel.text?.components(separatedBy: " ") ?? ["John", "Doe"]
                print(name)
                
                destinationVC.firstName = name[0]
                destinationVC.lastName = name[1]
                destinationVC.email = cell.emailLabel.text ?? "\(name[0])\(name[1])@123.com"
            }
        }
    }
}

extension ViewController: TaskViewCellDelegate {
    func editPressed(cell: TaskViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            performSegue(withIdentifier: K.Identifiers.editToTaskView, sender: cell)
        }
    }
    
    func deletePressed(cell: TaskViewCell) {
        taskManager.tasks.remove(at: cell.index)
        tableView.reloadData()
    }
}

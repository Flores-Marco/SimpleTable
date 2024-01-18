//
//  TaskViewController.swift
//  SimpleTable
//
//  Created by Marco Antonio Flores Perez on 17/01/24.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    let taskManager = TaskManager.shared
    var index = -1
    var firstName = ""
    var lastName = ""
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        emailLabel.text = email
    }
    
    func isValidEmail(email: String) -> Bool {
        let first = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let server = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = first + "@" + server + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email) || true
    }

    @IBAction func onSavePressed(_ sender: Any) {
        if let firstName = firstNameLabel.text,
           let lastName = lastNameLabel.text,
           let email = emailLabel.text {
            if isValidEmail(email: email) {
                if index == -1 {
                    taskManager.createTask(firstName: firstName, lastName: lastName, email: email)
                } else {
                    taskManager.updateTask(firstName: firstName, lastName: lastName, email: email, at: index)
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}

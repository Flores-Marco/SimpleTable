//
//  TaskManager.swift
//  SimpleTable
//
//  Created by Marco Antonio Flores Perez on 17/01/24.
//

import Foundation

struct Task {
    var firstName: String
    var lastName: String
    var email: String
}

class TaskManager {
    static let shared = TaskManager()
    
    private init() {}
    var tasks: [Task] = []
    
    func deleteTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func createTask(firstName: String, lastName: String, email: String) {
        let newTask = Task(firstName: firstName, lastName: lastName, email: email)
        tasks.append(newTask)
    }
    
    func updateTask(firstName: String, lastName: String, email: String, at index: Int) {
        let updatedTask = Task(firstName: firstName, lastName: lastName, email: email)
        tasks[index] = updatedTask
    }
}

//
//  TaskManager.swift
//  SimpleTable
//
//  Created by Marco Antonio Flores Perez on 17/01/24.
//

import Foundation

enum TaskAction {
    case Add
    case Delete
    case Edit
}

struct Task {
    var firstName: String
    var lastName: String
    var email: String
}

class TaskManager {
    static let shared = TaskManager()
    
    private init() {}
    var tasks: [Task] = []
    
    func taskAction(actionType: TaskAction, at index: Int) {
        switch actionType {
            case .Delete:
                tasks.remove(at: index)
            case .Edit:
                print(tasks[index])
            default:
            tasks.append(Task(firstName: "", lastName: "", email: ""))
        }
    }
}

//
//  Task.swift
//  Exp_TableView
//
//  Created by Alexander on 23.11.2020.
//

import Foundation

enum TaskType {
    case daily, weekly, yearly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}

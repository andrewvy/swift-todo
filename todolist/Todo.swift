//
//  Todo.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import Foundation

struct Todo {
    let label: String
    let isCompleted: Bool

    init(label: String) {
        self.label = label
        self.isCompleted = false
    }
}
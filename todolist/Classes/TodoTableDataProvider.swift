//
//  TodoTableDataProvider.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import UIKit

class TodoTableDataProvider: NSObject, UITableViewDataSource {
    private let cellIdentifier = "Cell"
    private var todos = [Todo]()
    
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo.label
        
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        todos.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}

extension TodoTableDataProvider {
    func addTodo(todo: Todo) {
        todos.append(todo)
    }
}
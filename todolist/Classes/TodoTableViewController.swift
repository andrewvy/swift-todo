//
//  TodoTableViewController.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    var dataProvider: TodoTableDataProvider?
    
    override func viewDidLoad() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTodo")
        navigationItem.rightBarButtonItem = addButton

        tableView.dataSource = dataProvider
        dataProvider?.registerCellsForTableView(tableView)
    }

    func addTodo() {
        let todoCreationController = TodoCreationController(title: "New Todo", message: "Add a new item", preferredStyle: .Alert)
        todoCreationController.delegate = self
        
        presentViewController(todoCreationController, animated: true, completion: nil)
    }

    func finishAddTodo(label: String?) {
        self.dataProvider?.addTodo(Todo(label: label!))
        self.tableView.reloadData()
    }
}

//
//  TodoTableViewController.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController, TodoCreationDelegate {
    var dataProvider: TodoTableDataProvider?

    override func viewDidLoad() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTodo")
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "didToggleEditMode")

        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = addButton

        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.dataSource = dataProvider
        dataProvider?.registerCellsForTableView(tableView)
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (tableView.editing) {
            selectedWhileEditing(tableView, indexPath: indexPath)
        } else {
            selectedWhileNotEditing(tableView, indexPath: indexPath)
        }
    }

    func selectedWhileEditing(tableView: UITableView, indexPath: NSIndexPath) {
        // Do stuff
    }

    func selectedWhileNotEditing(tableView: UITableView, indexPath: NSIndexPath) {
        guard let todo = dataProvider?.todoForIndexPath(indexPath) else { return }
        let detailedViewController = TodoDetailedViewController(todo: todo)

        navigationController?.pushViewController(detailedViewController, animated: true)
    }

    func didToggleEditMode () {
        setEditing(!editing, animated: true)
    }

    func addTodo() {
        setEditing(false, animated: true)

        let todoCreationController = TodoCreationController(title: "New Todo", message: "Add a new item", preferredStyle: .Alert)
        todoCreationController.delegate = self
        
        presentViewController(todoCreationController, animated: true, completion: nil)
    }

    func finishAddTodo(label: String?) {
        dataProvider?.addTodo(Todo(label: label!))
        tableView.reloadData()
    }
}

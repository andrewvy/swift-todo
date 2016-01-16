//
//  TodoCreationController.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import UIKit

class TodoCreationController: UIAlertController {
    var inputTextField: UITextField?
    var delegate: TodoTableViewController?

    override func viewDidLoad() {
        self.addTextFieldWithConfigurationHandler(configureLabel)
        super.viewDidLoad()

        self.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: finishAddTodo))
    }

    func finishAddTodo(alert: UIAlertAction!) {
        delegate!.finishAddTodo(self.inputTextField!.text)
    }
    
    func configureLabel(textField: UITextField) {
        textField.placeholder = "Label"
        self.inputTextField = textField
    }
}
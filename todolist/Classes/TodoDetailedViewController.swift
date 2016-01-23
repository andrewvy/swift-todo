//
//  TodoDetailedView.swift
//  todolist
//
//  Created by Andrew Vy on 1/22/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import UIKit

class TodoDetailedViewController: UIViewController {
    var todo: Todo
    var label = UILabel()
    var todoLabel = UILabel()

    init(todo: Todo) {
        self.todo = todo

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Todo:"
        label.frame = CGRect(x: 10, y: 20, width: 150, height: 150)
        label.font = UIFont(name: "HelveticaNeue", size: 36.0)

        todoLabel.text = todo.label
        todoLabel.frame = CGRect(x: 10, y: 65, width: 150, height: 150)
        todoLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)

        view.addSubview(label)
        view.addSubview(todoLabel)
        view.backgroundColor = UIColor.whiteColor()
    }
}
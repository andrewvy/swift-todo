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

    init(todo: Todo) {
        self.todo = todo

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = todo.label
        label.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 36.0)

        view.addSubview(label)
        view.backgroundColor = UIColor.whiteColor()
    }
}
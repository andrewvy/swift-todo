//
//  ClientConfig.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import Foundation

public struct ClientConfig {
    let version: String
    let scheme: String
    let host: String

    public init(version: String, scheme: String, host: String) {
        self.version = version
        self.scheme = scheme
        self.host = host
    }
}
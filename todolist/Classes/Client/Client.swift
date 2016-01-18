//
//  Client.swift
//  todolist
//
//  Created by Andrew Vy on 1/16/16.
//  Copyright © 2016 Andrew Vy. All rights reserved.
//

import Foundation
import Alamofire

public final class Client {
    private static var _client: Client?

    internal class var sharedInstance: Client {
        if let client = _client {
            return client
        } else {
            fatalError("Initialize a client with initClientWithConfig before use!")
        }
    }

    internal class var APIBaseURL: String {
        let config = sharedInstance.config
        return "\(config.scheme)://\(config.host)/api/\(config.version)"
    }

    internal let config: ClientConfig
    internal var jwtToken: String

    private init(config: ClientConfig) {
        self.config = config
        self.jwtToken = ""
    }

    public class func initWithConfig(config: ClientConfig) {
        if _client != nil { fatalError("Config was already initialized") }
        _client = Client(config: config)
    }

    public class func destroy() {
        _client = nil
    }

    public class func setJwtToken(token: String) {
        self.sharedInstance.jwtToken = token
    }

    public class func removeJwtToken() {
        self.sharedInstance.jwtToken = ""
    }

    class func request(method: Alamofire.Method, _ url: URLStringConvertible, parameters: [String: AnyObject]? = nil) -> Request {
        let headers = [
            "Authorization": self.sharedInstance.jwtToken
        ]

        return Alamofire.request(method, url, headers: headers, parameters: parameters).responseJSON { response in
            return response;
        }
    }
}
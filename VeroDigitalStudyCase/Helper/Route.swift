//
//  Route.swift
//  VeroDigitalStudyCase
//
//  Created by Mehmet Bilir on 24.03.2023.
//

import Foundation

enum Route {

  static let baseUrl = "https://api.baubuddy.de"
  case login
  case getData
  
  var description:String {
    switch self {
    case.login:
        return "/index.php/login"
    case.getData:
        return "/dev/index.php/v1/tasks/select"
        
    }
  }
    
    var method:Method {
        switch self {
        case .login:
            return .post
        case .getData:
            return .get
        }
    }
    
    var urlString:String {
        switch self {
        case .login:
            return Route.baseUrl + self.description
        case .getData:
            return Route.baseUrl + self.description
        }
    }

    
    var headers:[String:String] {
        switch self {
        case .login:
            return [
                "Authorization": "Basic QVBJX0V4cGxvcmVyOjEyMzQ1NmlzQUxhbWVQYXNz",
                "Content-Type": "application/json"
              ]
        case .getData:
            guard let accessToken = UserDefaults.standard.string(forKey: "access_token") else {return ["":""]}
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json"
              ]
        }
    }
}

//
//  TodoApi.swift
//  Boilerplate
//
//  Created by admin-nw on 22/4/2024.
//

import Foundation
import Moya

enum TodoApi {
    case getTodos
}

extension TodoApi: TargetType {
    
    var baseURL: URL { URL(string: "https://jsonplaceholder.typicode.com")! }

    var path: String {
        switch self{
        case .getTodos:
            return "/todos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTodos:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTodos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

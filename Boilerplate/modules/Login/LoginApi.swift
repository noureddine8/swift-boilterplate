//
//  LoginApi.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation
import Moya

enum LoginApi {
    case login(loginObject: LoginRequest)
}

extension LoginApi: TargetType {
    
    var baseURL: URL { URL(string: "https://recruitment-api.pyt1.stg.jmr.pl")! }

    var path: String {
        switch self{
        case .login:
            return "/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let loginObject):
            return .requestParameters(parameters: loginObject.dictionary , encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

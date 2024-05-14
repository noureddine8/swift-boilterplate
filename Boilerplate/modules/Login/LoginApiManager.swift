//
//  LoginApiManager.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation
import Moya


protocol LoginApiManagerProtocol {
    var provider: MoyaProvider<LoginApi> { get }
    
    func login(loginRequest: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> ())
}

class LoginApiManager: LoginApiManagerProtocol {
    var provider: MoyaProvider<LoginApi> = MoyaProvider<LoginApi>(plugins: [NetworkLoggerPlugin()])
    
    func login(loginRequest: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> ()) {
        provider.request(.login(loginObject: loginRequest)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

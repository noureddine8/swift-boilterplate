//
//  TodoApiManager.swift
//  Boilerplate
//
//  Created by admin-nw on 23/4/2024.
//

import Foundation
import Moya

protocol TodoApiManagerProtocol {
    var provider: MoyaProvider<TodoApi> { get }
    
    func fetchTodos(completion: @escaping (Result<[TodoModel], Error>) -> ())
}

class TodoApiManager: TodoApiManagerProtocol {
    var provider: MoyaProvider<TodoApi> = MoyaProvider<TodoApi>(plugins: [NetworkLoggerPlugin()])
    
    func fetchTodos(completion: @escaping (Result<[TodoModel], any Error>) -> ()) {
        provider.request(.getTodos) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([TodoModel].self, from: response.data)
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

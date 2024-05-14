//
//  TodoViewModel.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation
import SwiftUI


final class TodoViewModel : ObservableObject {
    @Published var data: [TodoModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    var mainViewModel: MainViewModel
    var todoApiManager: TodoApiManagerProtocol

    init(mainViewModel: MainViewModel, todoApiManager: TodoApiManagerProtocol) {
        self.mainViewModel = mainViewModel
        self.todoApiManager = todoApiManager
    }
    
    func getTodos() {
        isLoading = true
        todoApiManager.fetchTodos() { result in
            switch result {
            case .success(let todos):
                self.data = todos
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func logout() {
        let isDeleted = self.mainViewModel.keychainService.deleteValue(forKey: KeychainService.jwtKey)
        if isDeleted {
            self.mainViewModel.isLogedIn = false
        }
    }
}

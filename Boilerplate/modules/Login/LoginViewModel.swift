//
//  LoginViewModel.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    var mainViewModel: MainViewModel
    var loginManager: LoginApiManagerProtocol
    

    init(mainViewModel: MainViewModel, loginManager: LoginApiManagerProtocol) {
        self.mainViewModel = mainViewModel
        self.loginManager = loginManager
    }
    //{
      //"login": "correct_login@example.com",
      //"password": "C0rr3Ct_P@55w0rd"
    //}
    
    func login() {
        let loginRequest = LoginRequest(login: username, password: password)
        isLoading = true
        errorMessage = ""
        loginManager.login(loginRequest: loginRequest) { result in
            switch result {
            case .success(let loginResponse):
                self.isLoading = false
                if loginResponse.status == "ok" {
                    let isSaved = self.mainViewModel.keychainService.saveValue(loginResponse.message, forKey: KeychainService.jwtKey)
                    if isSaved {
                        self.mainViewModel.isLogedIn = true
                    }
                } else {
                    self.errorMessage = loginResponse.message
                }
            case .failure(let error):
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

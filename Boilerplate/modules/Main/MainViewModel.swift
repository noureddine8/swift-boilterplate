//
//  MainViewModel.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 13/5/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var isLogedIn: Bool = false
    
    let keychainService: KeychainServiceProtocol
    
    init(keychainService: KeychainServiceProtocol) {
        self.keychainService = keychainService
    }
    
    func checkAuthenticationStatus() {
        let jwt = keychainService.getValue(forKey: KeychainService.jwtKey)
        if jwt != nil {
            isLogedIn = true
        } else {
            isLogedIn = false
        }
    }
}

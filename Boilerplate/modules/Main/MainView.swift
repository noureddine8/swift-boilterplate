//
//  MainView.swift
//  boilerplate
//
//  Created by admin-nw on 22/4/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack {
            if mainViewModel.isLogedIn {
                TodoView(todoViewModel: TodoViewModel(mainViewModel: mainViewModel, todoApiManager: TodoApiManager()))
            } else {
                LoginView(loginViewModel: LoginViewModel(mainViewModel: mainViewModel, loginManager: LoginApiManager()))
            }
        }.environmentObject(mainViewModel)
            .onAppear() {
                mainViewModel.checkAuthenticationStatus()
            }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(keychainService: KeychainService(service: "")))
}

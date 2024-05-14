//
//  LoginView.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        if loginViewModel.isLoading {
            Text("Loading...")
        } else {
            VStack() {
                
                Text("Login")
                .font(.largeTitle)
                .padding(.top, 80)
                .padding(.bottom, 150)
                .foregroundStyle(.blue)
                .fontWeight(.bold)
                
                TextField("Username", text: $loginViewModel.username)
                .padding()
                .frame(width: 300)
                .background(Color(R.color.secondary))
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 8))
                .textInputAutocapitalization(.never)
                
                SecureField("Password",text: $loginViewModel.password)
                .padding()
                .frame(width: 300)
                .background(Color(R.color.secondary))
                .clipShape(.rect(cornerRadius: 8))
                .padding()
                .privacySensitive()

                Button {
                    loginViewModel.login()
                } label: {
                    Text("Login")
                    .fontWeight(.medium)
                    .padding(.all, 12).frame(width: 300)
                    .foregroundStyle(.white)
                    .background(Color(R.color.primary))
                    .clipShape(.rect(cornerRadius: 8))
                }
                .padding()
                Text(loginViewModel.errorMessage).foregroundStyle(.red)
                
                Spacer()
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel(mainViewModel: MainViewModel(keychainService: KeychainService(service: "")), loginManager: LoginApiManager()))
}

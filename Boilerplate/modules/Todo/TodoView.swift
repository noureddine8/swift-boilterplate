//
//  TodoView.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var todoViewModel : TodoViewModel
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack {
            if todoViewModel.isLoading {
                Text("Loading...")
            } else {
                Button {
                    todoViewModel.logout()
                } label: {
                    Text("Logout")
                    .fontWeight(.medium)
                    .padding(.all, 12).frame(width: 300)
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.rect(cornerRadius: 8))
                }
                List(todoViewModel.data) { item in
                    Text(item.title)
                }
            }
        }.onAppear(perform: {
            todoViewModel.getTodos()
        })
    }
}

#Preview {
    TodoView(todoViewModel: TodoViewModel(mainViewModel: MainViewModel(keychainService: KeychainService(service: "")), todoApiManager: TodoApiManager()))
}

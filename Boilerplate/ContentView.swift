//
//  ContentView.swift
//  boilerplate
//
//  Created by admin-nw on 22/4/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var splashAppeared: Bool = false

    var body: some View {
        ZStack {
            if self.splashAppeared {
                NavigationView{
                    MainView(mainViewModel: MainViewModel(keychainService: KeychainService(service: "")))
                }
                .navigationViewStyle(.stack)
            } else {
                SplashView()
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                splashAppeared = true
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  SplashView.swift
//  boilerplate
//
//  Created by admin-nw on 22/4/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var scale = 0.3
    
    var body: some View {
        Image(R.image.nbW).scaleEffect(scale).onAppear {
            withAnimation(.easeIn(duration: 2.0)) {
                self.scale = 1.0
            }
        }
    }
}

#Preview {
    SplashView()
}

//
//  WishlistView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/9/25.
//

import SwiftUI

struct WishlistView: View {
    @State private var showLogin = false
    
    @ObservedObject var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if authManager.userSessionId == nil {
                    WishlistLoginView(showLogin: $showLogin)
                } else {
                    WishlistEmptyStateView()
                }
            }
            .padding()
            .sheet(isPresented: $showLogin, content: {
                LoginView(authManager: authManager)
            })
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView(authManager: AuthManager(service: MockAuthService()))
}

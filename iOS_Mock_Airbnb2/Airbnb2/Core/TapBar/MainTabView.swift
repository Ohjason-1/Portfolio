//
//  MainTabView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/9/25.
//

import SwiftUI

struct MainTabView: View {
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        
    }
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")}
            
            WishlistView(authManager: authManager)
                .tabItem { Label("Wishlists", systemImage: "heart")}
            
            ProfileView(authManager: authManager).tabItem { Label("Profile", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView(authManager: AuthManager(service: MockAuthService()))
}

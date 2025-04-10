//
//  MainTabView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/9/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")}
            WishlistView()
                .tabItem { Label("Wishlists", systemImage: "heart")}
            
            ProfileView().tabItem { Label("Profile", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView()
}

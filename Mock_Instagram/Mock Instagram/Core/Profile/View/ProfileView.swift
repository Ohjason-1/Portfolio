//
//  ProfileView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/24/25.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}

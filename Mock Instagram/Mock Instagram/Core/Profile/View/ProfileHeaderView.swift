//
//  ProfileHeaderView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/27/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    var body: some View {
        VStack(spacing: 10) {
                // pic and stats
                HStack {
                    CircularProfileImageView(user: user, size: .large)
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStackView(value: 3, title: "Posts")
                        
                        UserStackView(value: 12, title: "Followers")
                        
                        UserStackView(value: 24, title: "Following")
                    }
                }
                .padding(.horizontal)
                
                // name and bio
                VStack(alignment: .leading, spacing: 4) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    Text(user.username)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        print("Follow user")
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(user.isCurrentUser ? .black : .white)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                        )
                }
                
                Divider()
            }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}


#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}

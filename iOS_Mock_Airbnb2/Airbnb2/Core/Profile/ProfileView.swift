//
//  ProfileView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/9/25.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authManager: AuthManager
    @State private var showLogin = false
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        VStack {
            // profile login view
            if authManager.userSessionId == nil {
                ProfileLoginView(showLogin: $showLogin)
            } else {
                UserProfileHeaderView()
            }
            
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
            
            if authManager.userSessionId != nil {
                Button {
                    authManager.signout()
                } label: {
                    Text("Log Out")
                        .underline()
                        .foregroundStyle(.black)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .sheet(isPresented: $showLogin, content: {
            LoginView(authManager: authManager)
        })
        .padding()
        
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}

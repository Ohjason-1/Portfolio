//
//  MainMenuView.swift
//  Echo
//
//  Created by Ethan Gale on 12/8/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                // App Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 80)
                    .padding()

                // Navigation Buttons
                NavigationLink(destination: RecordEchoWorkflowView()) {
                    Text("Record Messages")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                NavigationLink(destination: ProfilePageView(
                    profile: ProfilePage(
                        bibliography: "I love to write to myself",
                        name: "John Doe",
                        email: "johndoe@example.com",
                        birthday: "5/3/2005"
                    ),
                    onBack: {} // Empty closure for now
                )) {
                    Text("Profile")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainMenuView()
}

//
//  ProfileLoginView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct ProfileLoginView: View {
    @Binding var showLogin: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip")
            }
            
            
            Button {
                showLogin.toggle()
            } label: {
                Text("Log in")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 48)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            HStack {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
        }
    }
}

#Preview {
    ProfileLoginView(showLogin: .constant(false))
}

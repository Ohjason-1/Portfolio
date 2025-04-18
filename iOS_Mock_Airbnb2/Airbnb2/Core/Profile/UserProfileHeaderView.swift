//
//  UserProfileHeaderView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
            
            VStack(spacing: 12) {
                CircularProfileImageView(size: .xLarge)
                
                VStack {
                    Text("John Doe")
                        .font(.footnote)
                    
                    Text("Guest")
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    UserProfileHeaderView()
}

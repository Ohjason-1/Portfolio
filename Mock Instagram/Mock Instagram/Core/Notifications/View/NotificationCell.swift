//
//  NotificationCell.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView(size: .xSmall)
            
            // notification message
            HStack {
                Text("yuki")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text("liked one of your posts.")
                    .font(.subheadline) +
                
                Text("3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            
            Spacer()
            
            Image("image9")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .padding(.leading, 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}

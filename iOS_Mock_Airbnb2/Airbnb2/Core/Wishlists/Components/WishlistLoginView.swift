//
//  WishlistLoginView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct WishlistLoginView: View {
    @Binding var showLogin: Bool
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Log in to view your wishlists")
                    .font(.headline)
                
                Text("You can create, view or edit wishlists once you've logged in")
                    .font(.footnote)
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
            Spacer()
        }
    }
}

#Preview {
    WishlistLoginView(showLogin: .constant(false))
}

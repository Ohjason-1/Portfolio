//
//  WishlistEmptyStateView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct WishlistEmptyStateView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Create ")
                .font(.headline)
            
            Text("As you explore, tap the heart icon to save your favorite places to a wishlist")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WishlistEmptyStateView()
}

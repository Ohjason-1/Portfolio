//
//  SearchAndFilterBar.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/8/25.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Start your search")
        }
        .font(.system(size: 14))
        .bold()
        .frame(width: 300, height: 40)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius:2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}

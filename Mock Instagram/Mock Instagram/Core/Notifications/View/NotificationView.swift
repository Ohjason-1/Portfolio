//
//  NotificationView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0 ..< 15) { notification in
                        NotificationCell()
                            .padding(.top)
                        
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationView()
}

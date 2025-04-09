//
//  AirbnbDetailView.swift
//  Mock Airbnb
//
//  Created by Jaewon Oh on 3/20/25.
//

import SwiftUI

struct AirbnbDetailView: View {
    let model: AirbnbListing
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                Image("furniture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.frame(in: .global).width)
                Text("The name is \(model.name)")
                    .bold()
                Text("The city is \(model.city)")
                Text("The host is \(model.host_id)")
                Text("The room is \(model.room_type)")
            }
            .frame(maxWidth: proxy.frame(in: .global).width)
        }
    }
}


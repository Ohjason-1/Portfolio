//
//  AirbnbListingCardView.swift
//  Mock Airbnb
//
//  Created by Jaewon Oh on 3/20/25.
//

import SwiftUI

struct AirbnbListingCardView: View {
    let model: AirbnbListing
    var body: some View {
        HStack {
            Image("furniture")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(model.name)
                .lineLimit(1)
                .font(.system(size: 10))
                .bold()
            
            Text(model.room_type)
                .font(.system(size: 10))
                .bold()
            
            Text(model.city)
                .foregroundColor(Color(.secondaryLabel))
                .font(.system(size: 10))
                .bold()
        }
    }
}


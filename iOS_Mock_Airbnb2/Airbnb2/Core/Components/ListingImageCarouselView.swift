//
//  ListingImageCarouselView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/8/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "Image 1",
        "Image 2",
        "Image 3",
        "Image 4",
    ]
    
    var randomImages: [String] {
        images.shuffled()
    }
    var body: some View {
        TabView {
            ForEach(randomImages, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}

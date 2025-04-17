//
//  MapListingPreview.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct ListingMapPreviewView: View {
    let listing: Listing
    var body: some View {
        VStack {
            TabView {
                ForEach(listing.imageURLs, id: \.self) { imageUrl in
                    Image(imageUrl)
                        .resizable()
                        .clipShape(Rectangle())
                    
                }
                
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("8 nights: Dec 12 - 21")
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                Text("\(listing.rating)")
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ListingMapPreviewView(listing: DeveloperPreview.shared.listings[0])
}

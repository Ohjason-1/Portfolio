//
//  AirbnbListingsView.swift
//  Mock Airbnb
//
//  Created by Jaewon Oh on 3/20/25.
//

import SwiftUI

struct AirbnbListingsView: View {
    @ObservedObject var viewModel = AirbnbListingsViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.listings.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.listings) { listing in
                        NavigationLink(destination: AirbnbDetailView(model: listing), label: {
                            AirbnbListingCardView(model: listing)
                        })
                    }
                }
            }
            .navigationTitle("Airbnb")
        }
        .onAppear {
            viewModel.fetchListings()
        }
    }
}



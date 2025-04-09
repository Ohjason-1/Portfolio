//
//  AirbnbListingsResponse.swift
//  Mock Airbnb
//
//  Created by Jaewon Oh on 3/20/25.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListing]
}


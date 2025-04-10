//
//  ExploreService.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/10/25.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}

//
//  AirbnbListing.swift
//  Mock Airbnb
//
//  Created by Jaewon Oh on 3/20/25.
//

import Foundation

struct AirbnbListing: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let host_id: Int
    let room_type: String
    let city: String
}

//"total_count": 1414018,
//  "results": [
//    {
//      "id": 40438184,
//      "name": "90 m2 atypical design close to the SACRE COEUR - Professional Cleaning",
//      "host_id": 312794780,
//      "neighbourhood": "Buttes-Montmartre",
//      "room_type": "Entire home/apt",
//      "column_10": 210,
//      "minimum_nights": 1,
//      "number_of_reviews": 3,
//      "last_review": "2020-01-11",
//      "reviews_per_month": 0.56,
//      "calculated_host_listings_count": 1,
//      "availability_365": 0,
//      "updated_date": "2020-06-11",
//      "city": "Paris",
//      "column_19": "France",
//      "coordinates": {
//        "lon": 2.35689336117435,
//        "lat": 48.8891710837236
//      },
//      "column_20": "France, Paris, Buttes-Montmartre"
//    },

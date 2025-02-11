//
//  Item.swift
//  Echo
//
//  Created by Ethan Gale on 11/21/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

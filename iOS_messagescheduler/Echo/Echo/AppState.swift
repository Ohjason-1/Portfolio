//
//  AppState.swift
//  Echo
//
//  Created by Ethan Gale on 12/8/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentUser: String = "John Doe"
    @Published var selectedDate: Date = Date()
}

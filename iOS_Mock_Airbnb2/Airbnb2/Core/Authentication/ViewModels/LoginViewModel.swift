//
//  LoginViewModel.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }
}

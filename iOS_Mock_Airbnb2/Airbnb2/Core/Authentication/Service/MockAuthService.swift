//
//  MockAuthService.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
    
    func login(withEmail email: String, password: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func signout() { }
}

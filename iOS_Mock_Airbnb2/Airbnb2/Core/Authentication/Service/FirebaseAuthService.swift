//
//  FirebaseAuthService.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import FirebaseAuth

struct FirebaseAuthService: AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws -> String? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user.uid
        } catch {
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return result.user.uid
        } catch {
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
    }
}

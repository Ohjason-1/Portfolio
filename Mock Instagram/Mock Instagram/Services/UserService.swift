//
//  UserService.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/4/25.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("user").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments() // get all users from users collection
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        
    }
}

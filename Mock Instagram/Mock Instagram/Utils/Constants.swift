//
//  Constants.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/7/25.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
    
    static let FollowingCollection = Root.collection("following")
    
    static let FollowersCollection = Root.collection("followers")
}

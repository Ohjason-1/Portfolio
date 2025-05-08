//
//  DeveloperPreview.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOnwerUid: "123", commentText: "Test", postId: "231", timestamp: Timestamp(), commentOwnerUid: "1290232")
}

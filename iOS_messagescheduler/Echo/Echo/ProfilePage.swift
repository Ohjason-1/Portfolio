//
//  ProfilePage.swift
//  Echo
//
//  Created by Jaewon Oh on 11/21/24.
//
import Foundation
import UIKit

struct ProfilePage: Identifiable {
    let id = UUID()
    var bibliography: String?
    var name: String
    var email: String
    var birthday: String
    var profilePicture: UIImage?
}


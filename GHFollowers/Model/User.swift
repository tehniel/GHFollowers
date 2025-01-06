//
//  User.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 1/6/25.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: URL
    let name: String?
    let location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    let followers: Int
    let createdAt: String
}

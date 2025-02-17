//
//  Follower.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 1/6/25.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    let avatarUrl: URL
}

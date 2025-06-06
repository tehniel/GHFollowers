//
//  GHError.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 1/14/25.
//

import Foundation

enum GFError: String, Error  {
    case invalidUsername = "This username created am invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the sever. Please try again"
    case invalidData = "The data received from the sever was invalid. Please try again"
}

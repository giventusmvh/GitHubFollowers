//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Giventus Marco Victorio Handojo on 10/01/25.
//

import Foundation


enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete request. Please try again later"
    case invalidResponse = "Invalid response received. Please try again later"
    case invalidData = "Invalid data received. Please try again later"
}

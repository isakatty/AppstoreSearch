//
//  HTTPMethod.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

enum HTTPMethod {
    case get, put, post, patch, delete
    
    var toString: String {
        switch self {
        case .get:
            return "GET"
        case .put:
            return "PUT"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

//
//  NetworkRequest.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

enum NetworkRequest: EndPointType {
    case itunesSearch(searchText: String)
    
    var scheme: Scheme {
        .https
    }
    var host: String {
        "itunes.apple.com"
    }
    var port: String {
        ""
    }
    var path: String {
        "/search"
    }
    var query: [String : Any] {
        switch self {
        case .itunesSearch(let searchText):
            return [
                "term": searchText,
                "country": "kr",
                "entity": "software"
            ]
        }
    }
    var header: [String : String] {
        return [:]
    }
    var body: [String : Any] {
        return [:]
    }
    var method: String {
        return HTTPMethod.get.toString
    }
}

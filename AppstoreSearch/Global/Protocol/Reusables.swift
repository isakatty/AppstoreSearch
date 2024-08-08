//
//  Reusables.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import Foundation

protocol Reusables {
    static var identifier: String { get }
}

extension Reusables {
    static var identifier: String {
        return String(describing: self)
    }
}

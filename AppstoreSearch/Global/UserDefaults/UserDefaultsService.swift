//
//  UserDefaultsService.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import Foundation

final class UserDefaultsService {
    private enum UserDefaultsKey: String {
        case searchedTerms = "terms"
    }

    func getTerms() -> [String] {
        UserDefaults.standard.array(forKey: UserDefaultsKey.searchedTerms.rawValue) as? [String] ?? []
    }

    func setTerms(_ terms: [String]) {
        UserDefaults.standard.setValue(terms, forKey: UserDefaultsKey.searchedTerms.rawValue)
    }
}

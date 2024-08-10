//
//  SearchDetailInfoViewModel.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import Foundation

import RxSwift
import RxCocoa

final class SearchDetailInfoViewModel {
    
    var appInfo: AppStoreSearchResult
    
    init(appInfo: AppStoreSearchResult) {
        self.appInfo = appInfo
    }
}

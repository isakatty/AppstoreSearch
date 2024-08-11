//
//  SearchDetailInfoViewModel.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import Foundation

import RxSwift
import RxCocoa

final class SearchDetailInfoViewModel: ViewModelType {
    
    var appInfo: AppStoreSearchResult
    
    init(appInfo: AppStoreSearchResult) {
        self.appInfo = appInfo
    }
    
    struct Input {
        
    }
    struct Output {
        let appInfo: BehaviorSubject<AppStoreSearchResult>
    }
    func transform(input: Input) -> Output {
        
        return Output(appInfo: BehaviorSubject<AppStoreSearchResult>(value: appInfo))
    }
}

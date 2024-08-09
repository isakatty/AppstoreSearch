//
//  SearchiTunesViewModel.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

import RxSwift
import RxCocoa

final class SearchiTunesViewModel: ViewModelType {
    private let disposeBag = DisposeBag()
    
    struct Input {
        
    }
    struct Output {
        let searchedList: BehaviorSubject<[String]>
    }
    func transform(input: Input) -> Output {
        let output = Output(searchedList: .init(value: []))
        
        return output
    }
}

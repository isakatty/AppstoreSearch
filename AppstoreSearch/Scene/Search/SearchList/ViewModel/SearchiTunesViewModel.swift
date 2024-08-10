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
        let viewDidLoad: Observable<Void>
        let searchText: ControlProperty<String>
        let searchEnterTap: ControlEvent<Void>
    }
    struct Output {
        let searchedList: PublishRelay<[String]>
        let searchResult: PublishRelay<[AppStoreSearchResult]>
    }
    func transform(input: Input) -> Output {
        let appList = PublishRelay<[AppStoreSearchResult]>()
        
        let output = Output(
            searchedList: .init(),
            searchResult: appList
        )
        
        input.viewDidLoad
            .subscribe(onNext: { _ in
                print("하이루")
            })
            .disposed(by: disposeBag)
        
        input.searchEnterTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .map { "\($0)" }
            .flatMap({ text in
                NetworkManager.shared.callRequest(searchedText: text, type: AppStoreSearchDTO.self)
            })
            .subscribe(with: self) { owner, list in
                appList.accept(list.toDomain.results)
            }
            .disposed(by: disposeBag)
        
        input.searchText
            .map { "\($0)" }
            .subscribe { text in
                print(text, "헬롱")
            }
            .disposed(by: disposeBag)
        
        return output
    }
}

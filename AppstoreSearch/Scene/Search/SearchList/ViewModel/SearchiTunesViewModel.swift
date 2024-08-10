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
    private let userDefaultsService = UserDefaultsService()
    
    struct Input {
        let viewState: BehaviorRelay<SearchViewState>
        let searchText: ControlProperty<String>
        let searchEnterTap: ControlEvent<Void>
        let searchCancelTap: ControlEvent<Void>
        let selectedAppInfo: PublishRelay<AppStoreSearchResult>
    }
    struct Output {
        let viewState: BehaviorRelay<SearchViewState>
        let searchedList: BehaviorRelay<[String]>
        let searchResult: PublishRelay<[AppStoreSearchResult]>
        let selectedAppInfo: PublishRelay<AppStoreSearchResult>
    }
    func transform(input: Input) -> Output {
        let appList = PublishRelay<[AppStoreSearchResult]>()
        let searchTerms = BehaviorRelay<[String]>(value: userDefaultsService.getTerms())
        let output = Output(
            viewState: input.viewState,
            searchedList: searchTerms,
            searchResult: appList,
            selectedAppInfo: input.selectedAppInfo
        )
        
        input.viewState
            .subscribe(with: self) { owner, state in
                print("view state : \(state)")
                if state == .initialLoad {
                    searchTerms.accept(owner.userDefaultsService.getTerms())
                }
            }
            .disposed(by: disposeBag)
        
        /*
         Error를 만났을 때 stream이 끝나버림
         */
        input.searchEnterTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .map { "\($0)" }
            .subscribe(with: self) { owner, text in
                var existTerms: [String] = owner.userDefaultsService.getTerms()
                if let index = existTerms.firstIndex(of: text) {
                    existTerms.remove(at: index)
                }
                existTerms.insert(text, at: 0)
                owner.userDefaultsService.setTerms(existTerms)
            }
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
            } onError: { owner, err in
                // 에러 만났을 때 어떻게 해줘야 할까 -> 에러 만났을 때 검색이 된건지 안된건지 알 수 없어서 여러번 검색하는 나.를 발견.
                print(err)
            }
            .disposed(by: disposeBag)
        
        return output
    }
}

//
//  SearchiTunesViewController.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

enum SearchViewState {
    case initialLoad
    case already
}

final class SearchiTunesViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let searchViewModel = SearchiTunesViewModel()
    
    private var state: SearchViewState = .initialLoad
    
    private let searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "앱을 검색해보세요 :)"
        return search
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            SearchListTableViewCell.self,
            forCellReuseIdentifier: SearchListTableViewCell.identifier
        )
        tableView.rowHeight = 50
        return tableView
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout()
        )
        collectionView.register(
            SearchListCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchListCollectionViewCell.identifier
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    override func configureHierarchy() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        [tableView, collectionView]
            .forEach { view.addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea)
        }
    }
    
    private func bind() {
        let viewState = BehaviorRelay<SearchViewState>(value: state)
        let selectedAppInfo = PublishRelay<AppStoreSearchResult>()
        
        let input = SearchiTunesViewModel.Input(
            viewState: viewState,
            searchText: searchController.searchBar.rx.text.orEmpty,
            searchEnterTap: searchController.searchBar.rx.searchButtonClicked,
            searchCancelTap: searchController.searchBar.rx.cancelButtonClicked,
            selectedAppInfo: selectedAppInfo
        )
        let output = searchViewModel.transform(input: input)
        
        output.viewState
            .observe(on: MainScheduler.instance)
            .bind(with: self) { owner, state in
                if state == .initialLoad {
                    owner.collectionView.isHidden = true
                    owner.tableView.isHidden = false
                } else {
                    owner.collectionView.isHidden = false
                    owner.tableView.isHidden = true
                }
            }
            .disposed(by: disposeBag)
        
        output.searchedList
            .bind(to: tableView.rx.items(cellIdentifier: SearchListTableViewCell.identifier, cellType: SearchListTableViewCell.self)) { row, element, cell in
                cell.configureUI(text: element)
            }
            .disposed(by: disposeBag)
        
        output.searchResult
            .bind(with: self) { owner, _ in
                owner.state = .already
                viewState.accept(owner.state)
            }
            .disposed(by: disposeBag)
        
        output.searchResult
            .bind(to: collectionView.rx.items(
                    cellIdentifier: SearchListCollectionViewCell.identifier,
                    cellType: SearchListCollectionViewCell.self)
            ) { row, element, cell in
                cell.configureUI(appInfo: element)
            }
            .disposed(by: disposeBag)
        
        Observable.zip(collectionView.rx.modelSelected(AppStoreSearchResult.self), collectionView.rx.itemSelected)
            .bind { appInfo, index in
                selectedAppInfo.accept(appInfo)
            }
            .disposed(by: disposeBag)
        
        output.selectedAppInfo
            .subscribe(with: self) { owner, appInfo in
                let vc = SearchDetailInfoViewController(viewModel: SearchDetailInfoViewModel(appInfo: appInfo))
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

extension SearchiTunesViewController {
    private func collectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 0,
            bottom: 5,
            trailing: 0
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

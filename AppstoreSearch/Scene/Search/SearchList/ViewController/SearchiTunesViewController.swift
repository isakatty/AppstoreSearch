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

final class SearchiTunesViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let searchViewModel = SearchiTunesViewModel()
    
    private var dummy = AppStoreSearch(resultCount: 0, results: [])
    private lazy var dummyRx = BehaviorRelay(value: dummy)
    
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
        tableView.rowHeight = 60
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
        
        test()
//        mockupDataTest()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bind()
    }
    override func configureHierarchy() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        
        [tableView, collectionView]
            .forEach { view.addSubview($0) }
    }
    override func configureLayout() {
        view.backgroundColor = .systemBackground
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea)
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea)
        }
        
        tableView.isHidden = true
    }
    
    private func bind() {
        let input = SearchiTunesViewModel.Input(
            viewDidLoad: rx
                .methodInvoked(#selector(UIViewController.viewDidLoad))
                .map { _ in }
            ,
            searchText: searchController.searchBar.rx.text.orEmpty,
            searchEnterTap: searchController.searchBar.rx.searchButtonClicked
        )
        let output = searchViewModel.transform(input: input)
        
        output.searchedList
            .bind(with: self) { owner, list in
                print("list")
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
        
        
    }
}
extension SearchiTunesViewController {
    private func test() {
        guard let urlRequest = NetworkRequest.itunesSearch(searchText: "카카오").toURLRequest else {
            print("URLRequest 에러")
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("에러")
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print("response 에러")
                return
            }
            if let data = data,
               let results = try? JSONDecoder().decode(AppStoreSearchDTO.self, from: data) {
                DispatchQueue.main.async {
                    self.dummy = results.toDomain
                    self.dummyRx.accept(self.dummy)
                }
            } else {
                print("모델 잘못된듯?")
            }
            
        }.resume()
    }
    private func mockupDataTest() {
        guard let path = Bundle.main.path(forResource: "mockSearchiTunesAPI", ofType: "json") else { return }
        guard let jsonString = try? String(contentsOfFile: path) else {
            return
        }
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        if let data = data,
           let result = try? decoder.decode(AppStoreSearchDTO.self, from: data) {
            self.dummy = result.toDomain
        }
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

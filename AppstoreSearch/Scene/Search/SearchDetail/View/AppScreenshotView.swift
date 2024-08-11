//
//  AppScreenshotView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class AppScreenshotView: BaseView {
    
    private let screenshotLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
        collectionView.register(AppScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: AppScreenshotCollectionViewCell.identifier)
        return collectionView
    }()
    private let vSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func configureHierarchy() {
        [screenshotLabel, collectionView, vSeperateBar]
            .forEach { addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        screenshotLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(10)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(screenshotLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(400)
        }
        vSeperateBar.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().inset(4)
        }
    }
}
extension AppScreenshotView {
    private func layout() -> UICollectionViewLayout {
        let leadingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.6),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitems: [leadingItem]
        )
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

//
//  SearchListCollectionViewCell.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

import RxSwift

final class SearchListCollectionViewCell: BaseCollectionViewCell {
    var disposeBag = DisposeBag()
    
    let topView = TopInfoView()
    private let middleView = MiddleInfoView()
    private let bottomView = BottomInfoView()
    
    override func configureHierarchy() {
        [topView, middleView, bottomView]
            .forEach { contentView.addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.23)
        }
        middleView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(middleView.snp.bottom)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        topView.configureUI(appInfo: appInfo)
        middleView.configureUI(appInfo: appInfo)
        bottomView.configureUI(appInfo: appInfo)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bottomView.configureImgNil()
        disposeBag = DisposeBag()
    }
}

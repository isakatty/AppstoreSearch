//
//  AppDetailInfoView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import SnapKit

/// 수평 스크롤 - 앱 정보
final class AppDetailInfoView: BaseView {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let topSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let rateView = DetailBottomImgView(isHiddenBar: true)
    private let ageView = DetailLabelView(topText: "연령", bottomText: "세")
    private let devView = DetailMiddleImgView(topLabelText: "개발자")
    private let languageView = DetailLabelView(topText: "언어", bottomText: nil)
    
    private let bottomSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func configureHierarchy() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [topSeperateBar, rateView, ageView, devView, languageView, bottomSeperateBar]
            .forEach { contentView.addSubview($0)}
    }
    override func configureLayout() {
        super.configureLayout()
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView.snp.height)
        }
        topSeperateBar.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.height.equalTo(1)
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.trailing.equalTo(contentView)
        }
        rateView.snp.makeConstraints { make in
            make.top.equalTo(topSeperateBar.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.width.equalTo(rateView.snp.height).multipliedBy(1.4)
            make.bottom.equalTo(bottomSeperateBar.snp.top)
        }
        ageView.snp.makeConstraints { make in
            make.top.equalTo(topSeperateBar.snp.bottom)
            make.width.equalTo(rateView.snp.height).multipliedBy(1.4)
            make.leading.equalTo(rateView.snp.trailing)
            make.bottom.equalTo(bottomSeperateBar.snp.top)
        }
        devView.snp.makeConstraints { make in
            make.top.equalTo(topSeperateBar.snp.bottom)
            make.width.equalTo(rateView.snp.height).multipliedBy(1.4)
            make.leading.equalTo(ageView.snp.trailing)
            make.bottom.equalTo(bottomSeperateBar.snp.top)
        }
        languageView.snp.makeConstraints { make in
            make.top.equalTo(topSeperateBar.snp.bottom)
            make.width.equalTo(rateView.snp.height).multipliedBy(1.4)
            make.leading.equalTo(devView.snp.trailing)
            make.bottom.equalTo(bottomSeperateBar.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        bottomSeperateBar.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.height.equalTo(1)
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.trailing.equalTo(contentView)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        rateView.configureUI(appInfo: appInfo)
        ageView.configureUI(appInfo: appInfo)
        devView.configureUI(appInfo: appInfo)
        languageView.configureUI(appInfo: appInfo)
    }
}

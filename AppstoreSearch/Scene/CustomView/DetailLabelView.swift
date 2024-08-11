//
//  DetailLabelView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import SnapKit

final class DetailLabelView: BaseView {
    var isHiddenBar: Bool
    var topText: String
    var bottomText: String?
    
    private let vSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    
    init(isHiddenBar: Bool = false, topText: String, bottomText: String?) {
        self.isHiddenBar = isHiddenBar
        self.topText = topText
        self.bottomText = bottomText
        
        topLabel.text = topText
        bottomLabel.text = bottomText
        
        super.init(frame: .zero)
    }
    
    override func configureHierarchy() {
        [vSeperateBar, topLabel, middleLabel, bottomLabel]
            .forEach { addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        vSeperateBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(1)
            make.verticalEdges.equalToSuperview().inset(20)
        }
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(16)
        }
        middleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(8)
        }
        bottomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
        
        vSeperateBar.isHidden = isHiddenBar
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        if bottomText == nil {
            if topText == "언어" {
                middleLabel.text = appInfo.languages.first
                let bottomText = appInfo.languages.count
                bottomLabel.text = "+ \(bottomText)개의 언어"
            }
        } else {
            middleLabel.text = appInfo.contentAdvisoryRating
            bottomLabel.text = bottomText
        }
    }
}

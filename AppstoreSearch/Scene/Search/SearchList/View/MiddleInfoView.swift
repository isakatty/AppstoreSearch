//
//  MiddleInfoView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

final class MiddleInfoView: BaseView {
    private let rateLabel: UIButton = {
        let btn = UIButton()
        btn.isEnabled = false
        btn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        return btn
    }()
    private let devNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override func configureHierarchy() {
        addSubview(stackView)
        
        [rateLabel, devNameLabel, categoryLabel]
            .forEach { stackView.addArrangedSubview($0) }
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        rateLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        stackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(10)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        let text = String(format: "%.2f", appInfo.averageUserRating)
        
        rateLabel.setTitle(text, for: .normal)
        devNameLabel.text = appInfo.developerName
        categoryLabel.text = appInfo.genres.first
    }
}

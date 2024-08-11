//
//  AppDescriptionView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import SnapKit

final class AppDescriptionView: BaseView {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    override func configureHierarchy() {
        addSubview(descriptionLabel)
    }
    override func configureLayout() {
        super.configureLayout()
        
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        descriptionLabel.text = appInfo.appDescription
    }
}

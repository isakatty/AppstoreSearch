//
//  TopInfoView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

import SnapKit

final class TopInfoView: BaseView {
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func configureHierarchy() {
        [appIconImageView, appNameLabel, downloadButton]
            .forEach { addSubview($0)}
    }
    override func configureLayout() {
        super.configureLayout()
        
        appIconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-8)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        appNameLabel.text = appInfo.appName
        loadAsyncImages(link: appInfo.artworkURL) { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.appIconImageView.image = image
            }
        }
    }
}

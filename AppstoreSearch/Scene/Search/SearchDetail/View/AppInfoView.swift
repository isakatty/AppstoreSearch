//
//  AppInfoView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import SnapKit

final class AppInfoView: BaseView {
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
        imageView.backgroundColor = .systemMint
        imageView.layer.cornerRadius = 16
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()
    private let devNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    override func configureHierarchy() {
        [appIconImageView, appNameLabel, downloadButton, devNameLabel]
            .forEach { addSubview($0)}
    }
    override func configureLayout() {
        super.configureLayout()
        
        appIconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.verticalEdges.equalToSuperview().inset(30)
            make.width.equalTo(appIconImageView.snp.height)
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView)
            make.leading.equalTo(appIconImageView.snp.trailing).offset(16)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-8)
        }
        
        devNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(appIconImageView.snp.trailing).offset(16)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-8)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.leading.equalTo(appIconImageView.snp.trailing).offset(16)
            make.bottom.equalTo(appIconImageView.snp.bottom)
            make.height.equalTo(32)
            make.width.equalTo(72)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        appNameLabel.text = appInfo.appName
        devNameLabel.text = appInfo.sellerName
        loadAsyncImages(link: appInfo.artworkURL) { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.appIconImageView.image = image
            }
        }
    }
}

//
//  BottomInfoView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

import SnapKit

final class BottomInfoView: BaseView {
    private let firstImg: UIImageView = {
        let image =  UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleToFill
        return image
    }()
    private let secondImg: UIImageView = {
        let image =  UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleToFill
        return image
    }()
    private let thirdImg: UIImageView = {
        let image =  UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func configureHierarchy() {
        [firstImg, secondImg, thirdImg]
            .forEach {
                addSubview($0)
            }
    }
    override func configureLayout() {
        super.configureLayout()
        
        secondImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.verticalEdges.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        firstImg.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.28)
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        thirdImg.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.28)
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    func configureUI(appInfo: AppStoreSearchResult) {
        // TODO: screenshotUrls 개수 확인해야함.
        loadAsyncImages(link: appInfo.screenshotUrls[0], completionHandler: { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.firstImg.image = image
            }
        })
        loadAsyncImages(link: appInfo.screenshotUrls[1], completionHandler: { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.secondImg.image = image
            }
        })
        loadAsyncImages(link: appInfo.screenshotUrls[2], completionHandler: { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.thirdImg.image = image
            }
        })
    }
    func configureImgNil() {
        [firstImg, secondImg, thirdImg]
            .forEach { $0.image = nil }
    }
}


//
//  AppScreenshotCollectionViewCell.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import RxSwift
import SnapKit

final class AppScreenshotCollectionViewCell: BaseCollectionViewCell {
    
    var disposeBag = DisposeBag()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    override func configureHierarchy() {
        contentView.addSubview(imageView)
    }
    override func configureLayout() {
        super.configureLayout()
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureUI(imageURL: String) {
        loadAsyncImages(link: imageURL) { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        disposeBag = DisposeBag()
    }
}

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
        view.contentMode = .scaleAspectFill
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
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalToSuperview().inset(8)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}

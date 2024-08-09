//
//  SearchListTableViewCell.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

import RxSwift

final class SearchListTableViewCell: BaseTableViewCell {
    var disposeBag = DisposeBag()
    
    private let timeImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "clock.arrow.circlepath")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    private let searchedTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    private let deleteBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "xmark")
        let btn = UIButton(configuration: config)
        return btn
    }()
    
    override func configureHierarchy() {
        [timeImgView, searchedTextLabel, deleteBtn]
            .forEach { contentView.addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        timeImgView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview().inset(16)
            make.width.equalTo(timeImgView.snp.height)
        }
        searchedTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeImgView.snp.trailing).inset(20)
            make.center.equalToSuperview()
        }
        deleteBtn.snp.makeConstraints { make in
            make.trailing.verticalEdges.equalToSuperview().inset(16)
            make.width.equalTo(deleteBtn.snp.height)
            make.leading.equalTo(searchedTextLabel.snp.trailing)
        }
    }
    
    func configureUI(text: String) {
        searchedTextLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}

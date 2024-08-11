//
//  DetailMiddleImgView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import SnapKit

final class DetailMiddleImgView: BaseView {
    var isHiddenBar: Bool
    
    private let vSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "개발자"
        return label
    }()
    private let middleImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.image = UIImage(systemName: "person.crop.square")
        view.tintColor = .lightGray
        return view
    }()
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "Kakao Corp."
        return label
    }()
    
    init(isHiddenBar: Bool = false) {
        self.isHiddenBar = isHiddenBar
        super.init(frame: .zero)
    }
    
    override func configureHierarchy() {
        [vSeperateBar, topLabel, middleImageView, bottomLabel]
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
        middleImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(2)
            make.width.equalTo(middleImageView.snp.height)
        }
        bottomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.top.equalTo(middleImageView.snp.bottom).offset(2)
        }
        
        vSeperateBar.isHidden = isHiddenBar
    }
}

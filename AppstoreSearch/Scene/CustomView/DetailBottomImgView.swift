//
//  DetailBottomImgView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import SnapKit

final class DetailBottomImgView: BaseView {
    var isHiddenBar: Bool = false
    
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
        label.text = "380개의 평가"
        return label
    }()
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "1.4"
        return label
    }()
    private let bottomImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(systemName: "star.fill")
        view.tintColor = .lightGray
        return view
    }()
    
    init(isHiddenBar: Bool = false) {
        self.isHiddenBar = isHiddenBar
        
        super.init(frame: .zero)
    }
    
    override func configureHierarchy() {
        [vSeperateBar, topLabel, middleLabel, bottomImageView]
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
        bottomImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(middleLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().inset(16)
            make.width.lessThanOrEqualToSuperview().offset(-40)
        }
        vSeperateBar.isHidden = isHiddenBar
    }
}

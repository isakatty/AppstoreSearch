//
//  DetailLabelView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/11/24.
//

import UIKit

import SnapKit

final class DetailLabelView: BaseView {
    var isHiddenBar: Bool
    
    private let vSeperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let topLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.text = "연령"
        label.textColor = .lightGray
        return label
    }()
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textAlignment = .center
        label.text = "4+"
        label.textColor = .lightGray
        return label
    }()
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.text = "세"
        label.textColor = .lightGray
        return label
    }()
    
    
    init(isHiddenBar: Bool = false) {
        self.isHiddenBar = isHiddenBar
        
        super.init(frame: .zero)
    }
    
    
    override func configureHierarchy() {
        [vSeperateBar, topLabel, middleLabel, bottomLabel]
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
        bottomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
        
        vSeperateBar.isHidden = isHiddenBar
    }
    
}

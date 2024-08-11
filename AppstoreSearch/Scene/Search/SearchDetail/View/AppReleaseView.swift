//
//  AppReleaseView.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import SnapKit

final class AppReleaseView: BaseView {
    private let releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.text = "버전 2.8.0"
        return label
    }()
    private let versionRecordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("버전 기록", for: .normal)
        return btn
    }()
    private let recordDate: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.text = "3주 전"
        return label
    }()
    private let releaseDescription: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 15)
        view.textAlignment = .left
        view.isScrollEnabled = false
        view.isEditable = false
        view.isSelectable = false
        view.textContainerInset = .zero
        view.textContainer.lineFragmentPadding = 10
        view.backgroundColor = .clear
        view.text =
"""
- 인증 관련 기능 개선
- 화면 표출 기능 개선
"""
        return view
    }()
    
    private let seperateBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func configureHierarchy() {
        [releaseNotesLabel, versionLabel, versionRecordBtn, recordDate, releaseDescription, seperateBar]
            .forEach { addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        releaseNotesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(10)
        }
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseNotesLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
        }
        versionRecordBtn.snp.makeConstraints { make in
            make.bottom.equalTo(releaseNotesLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(20)
        }
        recordDate.snp.makeConstraints { make in
            make.top.equalTo(versionRecordBtn.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        releaseDescription.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
        }
        seperateBar.snp.makeConstraints { make in
            make.top.equalTo(releaseDescription.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().inset(4)
        }
    }
    
}

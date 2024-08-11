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
        return label
    }()
    private let releaseDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
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
    
    func configureUI(appInfo: AppStoreSearchResult) {
        versionLabel.text = appInfo.version
        let dif = dateDifference(from: appInfo.currentVersionReleaseDate, to: Date())
        let difArray = [dif.years, dif.months, dif.weeks, dif.days]
        let unitLabels = ["년 전", "달 전", "주 전", "일 전"]
        var timeStrings: [String] = []
        
        for (i, value) in difArray.enumerated() {
            if value != 0 {
                timeStrings.append("\(value)\(unitLabels[i])")
            }
        }
        let resultString = timeStrings.joined(separator: ", ")
        recordDate.text = resultString
        releaseDescription.text = appInfo.releaseNotes
    }
    func dateDifference(
        from startDate: Date,
        to endDate: Date
    ) -> (years: Int, months: Int, weeks: Int, days: Int) {
        let calendar = Calendar.current
        
        let totalDays = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        
        let daysInYear = 365
        let daysInMonth = 30
        let daysInWeek = 7
        
        let years = totalDays / daysInYear
        let remainingDaysAfterYears = totalDays % daysInYear
        
        let months = remainingDaysAfterYears / daysInMonth
        let remainingDaysAfterMonths = remainingDaysAfterYears % daysInMonth
        
        let weeks = remainingDaysAfterMonths / daysInWeek
        let days = remainingDaysAfterMonths % daysInWeek
        
        if years > 0 {
            return (years, 0, 0, 0)
        } else if months > 0 {
            return (0, months, 0, 0)
        } else if weeks > 0 {
            return (0, 0, weeks, 0)
        } else {
            return (0, 0, 0, days)
        }
    }
}

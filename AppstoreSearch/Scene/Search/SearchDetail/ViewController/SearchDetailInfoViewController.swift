//
//  SearchDetailInfoViewController.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/10/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

/*
 View
 - ScrollView (vertical)
    - App Info View (앱아이콘, 이름, 설명, 다운로드 버튼)
    - 평가, 연령, 차트, 개발자, 언어 (horizontal scroll)
    - release notes
        - 새로운 소식, 버전, 날짜, 버전 기록(뷰이동 버튼), 폴더블 버튼,
    - 미리보기 (horizontal scroll)
        - 스크린 샷
    - description
        - 설명 약간, 폴더블 버튼
        - 개발자 정보 (뷰이동 버튼)
 */

final class SearchDetailInfoViewController: BaseViewController {
    
    let viewModel: SearchDetailInfoViewModel
    
    private let vScrollView = UIScrollView()
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        return view
    }()
    private let appDetail = AppDetailInfoView()
    private let testImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(systemName: "star.fill")
        img.backgroundColor = .red
        img.tintColor = .white
        return img
    }()
    
    init(viewModel: SearchDetailInfoViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.appInfo.appName)
    }
    
    override func configureHierarchy() {
        view.addSubview(vScrollView)
        vScrollView.addSubview(containerView)
        
        [appDetail, testImg]
            .forEach { containerView.addSubview($0) }
    }
    override func configureLayout() {
        super.configureLayout()
        
        vScrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeArea)
        }
        containerView.snp.makeConstraints { make in
            make.width.equalTo(vScrollView.snp.width)
            make.verticalEdges.equalTo(vScrollView)
        }
        appDetail.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(containerView)
            make.height.equalTo(100)
        }
        testImg.snp.makeConstraints { make in
            make.top.equalTo(appDetail.snp.bottom).offset(10)
            make.leading.trailing.equalTo(containerView)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(1000)
        }
    }
}

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
    private let containerView = UIView()
    
    private let appInfo = AppInfoView()
    private let appDetail = AppDetailInfoView()
    private let releaseNotes = AppReleaseView()
    private let screenshotCollectionView = AppScreenshotView()
    private let appDescription = AppDescriptionView()
    
    private var disposeBag = DisposeBag()
    
    init(viewModel: SearchDetailInfoViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func configureHierarchy() {
        view.addSubview(vScrollView)
        vScrollView.addSubview(containerView)
        
        [appInfo, appDetail, releaseNotes, screenshotCollectionView, appDescription]
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
        appInfo.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(containerView)
            make.height.equalTo(containerView.snp.width).multipliedBy(0.33)
        }
        appDetail.snp.makeConstraints { make in
            make.top.equalTo(appInfo.snp.bottom)
            make.horizontalEdges.equalTo(containerView)
            make.height.equalTo(100)
        }
        releaseNotes.snp.makeConstraints { make in
            make.top.equalTo(appDetail.snp.bottom)
            make.horizontalEdges.equalTo(containerView)
        }
        screenshotCollectionView.snp.makeConstraints { make in
            make.top.equalTo(releaseNotes.snp.bottom)
            make.horizontalEdges.equalTo(containerView)
        }
        appDescription.snp.makeConstraints { make in
            make.top.equalTo(screenshotCollectionView.snp.bottom)
            make.horizontalEdges.bottom.equalTo(containerView)
        }
    }
    
    private func bind() {
        let input = SearchDetailInfoViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.appInfo
            .bind(with: self) { owner, appInfo in
                owner.appInfo.configureUI(appInfo: appInfo)
                owner.appDetail.configureUI(appInfo: appInfo)
                owner.releaseNotes.configureUI(appInfo: appInfo)
                owner.appDescription.configureUI(appInfo: appInfo)
            }
            .disposed(by: disposeBag)
        
        output.appInfo
            .map { $0.screenshotUrls }
            .bind(to: screenshotCollectionView.collectionView.rx.items(cellIdentifier: AppScreenshotCollectionViewCell.identifier, cellType: AppScreenshotCollectionViewCell.self)) { row, element, cell in
                cell.configureUI(imageURL: element)
            }
            .disposed(by: disposeBag)
    }
}

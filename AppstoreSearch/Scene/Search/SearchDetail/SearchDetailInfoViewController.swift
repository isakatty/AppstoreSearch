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

final class SearchDetailInfoViewController: BaseViewController {
    
    let viewModel: SearchDetailInfoViewModel
    
    init(viewModel: SearchDetailInfoViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.appInfo.appName)
    }
    
    override func configureHierarchy() {
        
    }
    override func configureLayout() {
        super.configureLayout()
        
    }
}

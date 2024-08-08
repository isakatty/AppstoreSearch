//
//  BaseViewController.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        
    }
    func configureLayout() {
        view.backgroundColor = .systemBackground
        
    }
}

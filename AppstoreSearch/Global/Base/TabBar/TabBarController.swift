//
//  TabBarController.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabbar()
    }
    
    private func configureTabbar() {
        let vcs = [
            ArcadeViewController(),
            TodayViewController(),
            GameViewController(),
            AppViewController(),
            SearchViewController()
        ]
        
        setViewControllers(
            configureTabs(vcGroup: vcs),
            animated: true
        )
    }
    private func configureTabs(vcGroup: [UIViewController]) -> [UINavigationController] {
        return vcGroup.enumerated().compactMap { (index, vc) in
            guard let tabBarItemCase = TabBarCase(rawValue: index) else { return nil }
            let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = tabBarItemCase.tabItem
            return navController
        }
    }
}

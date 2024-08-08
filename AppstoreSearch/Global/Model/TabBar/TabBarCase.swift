//
//  TabBarCase.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

enum TabBarCase: Int, CaseIterable {
    case today = 0
    case game
    case app
    case arcade
    case search
    
    var tabItem: UITabBarItem {
        switch self {
        case .today:
            return UITabBarItem(title: "투데이", image: UIImage(systemName: "book"), tag: rawValue)
        case .game:
            return UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: rawValue)
        case .app:
            return UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.fill"), tag: rawValue)
        case .arcade:
            return UITabBarItem(title: "아케이드", image: UIImage(systemName: "star"), tag: rawValue)
        case .search:
            return UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: rawValue)
        }
    }
}

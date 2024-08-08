//
//  TabBarCase.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import Foundation

enum TabBarCase: Int, CaseIterable {
    case today = 0
    case game
    case app
    case arcade
    case search
    
    var tabBarName: String {
        switch self {
        case .today: return "투데이"
        case .game: return "게임"
        case .app: return "앱"
        case .arcade: return "아케이드"
        case .search: return "검색"
        }
    }
    var nomalIconName: String {
        switch self {
        case .today: return "book"
        case .game: return "gamecontroller"
        case .app: return "square.stack.fill"
        case .arcade: return "star"
        case .search: return "magnifyingglass"
        }
    }
}

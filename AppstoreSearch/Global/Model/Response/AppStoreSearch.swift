//
//  AppStoreSearch.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

struct AppStoreSearch {
    let resultCount: Int
    let results: [AppStoreSearchResult]
}

struct AppStoreSearchResult {
    /// software
    let kind: String
    /// search result Detail VC에서 쓰일 image urls
    let screenshotUrls: [String]
    /// 해당 개발자가 만든 앱들 모음집
    let artistViewUrl: String
    /// 현 버전의 release date
    let currentVersionReleaseDate: Date
    /// release notes
    let releaseNotes: String?
    /// artistId - appStoreId
    let developrId: Int
    /// artistName - 개발자 이름
    let developerName: String
    /// 앱 카테고리
    let genres: [String]
    /// 처음 앱스토어 등록한 날짜
    let releaseDate: Date
    /// description - 앱 설명
    let appDescription: String
    /// trackName - App Name
    let appName: String
    /// 외부에 표출되는 dev Name
    let sellerName: String
    /// 평점
    let averageUserRating: Double
    /// 유료 무료 ?
    let formattedPrice: String
    /// 나이 기준
    let contentAdvisoryRating: String
    /// appstore 연결
    let linkToAppStore: String
    /// 최소 버전
    let minimumOsVersion: String
    /// release version
    let version: String
    /// app logo
    let artworkURL: String
    /// 앱 언어
    let languages: [String]
    /// 평가 개수
    let rateCount: Int
}

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
    let kind: String // software
    let screenshotUrls: [String] // search result Detail VC에서 쓰일 image urls
    let artistViewUrl: String // 해당 개발자가 만든 앱들 모음집
    let currentVersionReleaseDate: String // 현 버전의 release date
    let developrId: Int // artistId - appStoreId
    let developerName: String // artistName - 개발자 이름
    let genres: [String] // 앱 카테고리
    let releaseDate: String // 처음 앱스토어 등록한 날짜
    let appDescription: String // description - 앱 설명
    let appName: String // trackName - App Name
    let sellerName: String // 외부에 표출되는 dev Name
    let averageUserRating: Double // 평점
    let formattedPrice: String // 유료 무료 ?
    let contentAdvisoryRating: String // 나이 기준
    let linkToAppStore: String // appstore 연결
    let minimumOsVersion: String // 최소 버전
    let version: String // release version
}

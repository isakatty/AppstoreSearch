//
//  AppStoreSearchDTO.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

struct AppStoreSearchDTO: Decodable {
    let resultCount: Int
    let results: [AppStoreSearchResultDTO]
}

extension AppStoreSearchDTO {
    var toDomain: AppStoreSearch {
        return .init(
            resultCount: resultCount,
            results: results.map({ dto in
                AppStoreSearchResult(
                    kind: dto.kind,
                    screenshotUrls: dto.screenshotUrls,
                    artistViewUrl: dto.artistViewUrl,
                    currentVersionReleaseDate: dto.currentVersionReleaseDate,
                    developrId: dto.artistId,
                    developerName: dto.artistName,
                    genres: dto.genres,
                    releaseDate: dto.releaseDate,
                    appDescription: dto.description,
                    appName: dto.trackCensoredName,
                    sellerName: dto.sellerName,
                    averageUserRating: dto.averageUserRating,
                    formattedPrice: dto.formattedPrice,
                    contentAdvisoryRating: dto.contentAdvisoryRating,
                    linkToAppStore: dto.trackViewUrl,
                    minimumOsVersion: dto.minimumOsVersion,
                    version: dto.version,
                    artworkURL: dto.artworkUrl512
                )
            })
        )
    }
}

struct AppStoreSearchResultDTO: Decodable {
    let advisories: [String]
    let features: [String]
    let supportDevices: [String]?
    let isGameCenterEnabled: Bool
    let screenshotUrls, ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewUrl: String
    let kind: String
    let currency: String
    let currentVersionReleaseDate: String // iso8601
    let releaseNotes: String?
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double
    let releaseDate: String
    let genreIds: [String]
    let description: String
    let bundleId: String
    let primaryGenreName: String
    let primaryGenreId: Int
    let sellerName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let averageUserRatingForCurrentVersion: Double
    let averageUserRating: Double
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerUrl: String?
    let formattedPrice: String
    let contentAdvisoryRating: String
    let userRatingCountForCurrentVersion: Int
    let trackViewUrl: String
    let trackContentRating: String
    let minimumOsVersion: String // 최소버전
    let version: String //
    let wrapperType: String
    let userRatingCount: Int
}

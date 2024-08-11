//
//  NetworkManager.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import Foundation

import RxSwift

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unknownError
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func callRequest<T: Decodable>(searchedText: String, type: T.Type) -> Observable<T> {
        return Observable.create { observer in
            guard let urlRequest = NetworkRequest.itunesSearch(searchText: searchedText).toURLRequest else {
                observer.onError(NetworkError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error {
                    observer.onError(NetworkError.unknownError)
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    observer.onError(NetworkError.invalidResponse)
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let data,
                   let result = try? decoder.decode(T.self, from: data) {
                    observer.onNext(result)
                    observer.onCompleted()
                } else {
                    observer.onError(NetworkError.invalidData)
                }
            }.resume()
            
            return Disposables.create()
        }
    }
}

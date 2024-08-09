//
//  SearchiTunesViewController.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

final class SearchiTunesViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    private func test() {
        guard let urlRequest = NetworkRequest.itunesSearch(searchText: "지도").toURLRequest else {
            print("URLRequest 에러")
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("에러")
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print("response 에러")
                return
            }
            
//            if let data = data,
//               let result = String(data: data, encoding: .utf8) {
//                print(result)
//            } else {
//                print("data 오류")
//            }
            if let data = data,
               let results = try? JSONDecoder().decode(AppStoreSearchDTO.self, from: data) {
                print(results.results[1])
            } else {
                print("모델 잘못된듯?")
            }
            
        }.resume()
    }
}


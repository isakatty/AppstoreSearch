//
//  UIView+.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/9/24.
//

import UIKit

extension UIView {
    func loadAsyncImages(link: String, completionHandler: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: link) else {
            completionHandler(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, response != nil, error == nil else {
                completionHandler(nil)
                return
            }
            completionHandler(UIImage(data: data))
        }.resume()
    }
}

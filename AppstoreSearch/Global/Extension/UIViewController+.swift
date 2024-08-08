//
//  UIViewController+.swift
//  AppstoreSearch
//
//  Created by Jisoo Ham on 8/8/24.
//

import UIKit

extension UIViewController {
    var safeArea: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

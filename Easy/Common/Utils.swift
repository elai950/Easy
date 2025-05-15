//
//  Utils.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation
import UIKit.UIApplication

class Utils {
    static func getValueFromPlist(forKey key: String) -> String? {
        if let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            let value = dict[key] as! String
            return value
        }
        return nil
    }
    
    static func openYoutube(_ movieKey: String){
        if let url = URL(string: "https://www.youtube.com/watch?v=\(movieKey)") {
            UIApplication.shared.open(url)
        }
    }
}

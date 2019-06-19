//
//  AppearanceHelper.swift
//  Tasks
//
//  Created by Dongwoo Pae on 6/17/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import UIKit

enum Font: String {
    case fakeReceipt = "fake receipt"
    case burnstownDam = "burnstown dam"
    case goodTimes = "good times"
}

enum AppearanceHelper {
    
    static var backgroundBlue = UIColor(red: 91/255, green: 169/255, blue: 227/255, alpha: 1.0)
    static var mainColorRed = UIColor(red: 224/255, green: 99/255, blue: 99/255, alpha: 1.0)
    
    static func setUpFontAndSize(with textStyle: UIFont.TextStyle, size: CGFloat, font: Font) -> UIFont {
        let font = UIFont(name: font.rawValue, size: size)!
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = backgroundBlue
        UISegmentedControl.appearance().tintColor = mainColorRed
        UIBarButtonItem.appearance().tintColor = mainColorRed
        
        let textAattributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAattributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAattributes
        
        UITextField.appearance().tintColor = mainColorRed
        UITextView.appearance().tintColor = mainColorRed
    }
    
    static func style(label: UILabel) {
        label.font = setUpFontAndSize(with: .title1, size: 15, font: .goodTimes)
        label.textColor = .black
        label.backgroundColor = backgroundBlue
    }
    
}

//
//  Util.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/15/23.
//

import Foundation
import SwiftUI

struct AppColors {
    static let darkGreen = colorFromHex("495E57")
    static let yellow = colorFromHex("F4CE14")
    
    static let darkSalmon = colorFromHex("EE9972")
    static let lightSalmon = colorFromHex("FBDABB")
    static let lightGray = colorFromHex("EDEFEE")
    static let darkGray = colorFromHex("333333")
    
    static let white = Color.white
    static let black = Color.black
}

func colorFromHex(_ hex: String) -> Color {
    var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")
    
    var rgbValue: UInt64 = 0
    Scanner(string: formattedHex).scanHexInt64(&rgbValue)
    
    let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = Double(rgbValue & 0x0000FF) / 255.0
    
    return Color(red: red, green: green, blue: blue)
}

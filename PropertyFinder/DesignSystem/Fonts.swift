//
//  Fonts.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-28.
//

import SwiftUI

extension Font {
    static let h1: Font =  .roboto(.medium, size: 22)
    static let h2: Font = .roboto(.medium, size: 18)
    static let description: Font = .roboto(.regular, size: 16)
    
    static let summary: Font = .roboto(.bold, size: 16)
    static let price: Font = .roboto(.black, size: 18)
    static let detail: Font = .roboto(.regular, size: 16)
}

extension Font {
    static func roboto(_ type: Roboto, size: CGFloat) -> Self {
        let font = UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        return .init(uiFont: font)
    }
    
    private init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}

enum Roboto: String {
    case black = "Roboto-Black"
    case bold = "Roboto-Bold"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case medium = "Roboto-Medium"
    case regular = "Roboto-Regular"
    case thin = "Roboto-Thin"
}

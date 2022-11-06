//
//  CalculateMode.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import Foundation

enum CalculateMode: String {
    case add = "たしざん"
    case sub = "ひきざん"
    case addsub = "たすとひく"
    case mul = "かけざん"
    case div = "わりざん"
    case all = "ぜんぶ"
    
    var systemName: String {
        switch self {
        case .add:
            return "plus.circle"
        case .sub:
            return "minus.circle"
        case .addsub:
            return "plus.forwardslash.minus"
        case .mul:
            return "multiply.circle"
        case .div:
            return "divide.circle"
        case .all:
            return "circle"
        }
    }
    
    var simbolText: String {
        switch self {
        case .add:
            return "➕"
        case .sub:
            return "➖"
        case .mul:
            return "✖️"
        case .div:
            return "➗"
        default:
            return ""
        }
    }
}


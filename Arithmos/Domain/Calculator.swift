//
//  Calculator.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import Foundation

enum CalculateMode {
    case add
    case sub
    case mul
    case div
}


struct Calculator {
    func calculate(a: Int, b: Int, mode: CalculateMode) -> Int {
        switch mode {
        case .add: return add(a: a, b: b)
        case .sub: return sub(a: a, b: b)
        case .mul: return mul(a: a, b: b)
        case .div: return div(a: a, b: b)
        }
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sub(a: Int, b: Int) -> Int {
        if a > b {
            return a - b
        }
        return b - a
    }
    
    func mul(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func div(a: Int, b: Int) -> Int {
        // TODO: WIP
        if b <= 0 {
            return 0
        }
        return a / b
    }
}

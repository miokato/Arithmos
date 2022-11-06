//
//  Calculator.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import Foundation

struct CalculateResult {
    let leftValue: Int
    let rightValue: Int
    let resultValue: Int
}

struct Calculator {
    let minValue: Int
    let maxValue: Int
    
    func calculate(mode: CalculateMode) -> CalculateResult {
        switch mode {
        case .add: return add()
        case .sub: return sub()
        case .mul: return mul()
        case .div: return div()
        }
    }
    
    func add() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        return CalculateResult(leftValue: a, rightValue: b, resultValue: a + b)
    }
    
    func sub() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        if a > b {
            return CalculateResult(leftValue: a, rightValue: b, resultValue: a - b)
        }
        return CalculateResult(leftValue: b, rightValue: a, resultValue: b - a)
    }
    
    func mul() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        return CalculateResult(leftValue: a, rightValue: b, resultValue: a * b)
    }
    
    func div() -> CalculateResult {
        let left = Int.random(in: 1...10)
        let rights = factors(left)
        let right = rights.randomElement() ?? 1
        return CalculateResult(leftValue: left, rightValue: right, resultValue: left / right)
    }
}

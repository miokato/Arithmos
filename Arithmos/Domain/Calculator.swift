//
//  Calculator.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import Foundation

struct CalculateResult {
    let left: Int
    let right: Int
    let answer: Int
    let mode: CalculateMode
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
        case .all: return all()
        }
    }
    
    func all() -> CalculateResult {
        let modes: [CalculateMode] = [.add, .sub, .mul, .div]
        let mode = modes.randomElement() ?? .add
        return calculate(mode: mode)
    }
    
    func add() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        return CalculateResult(left: a, right: b, answer: a + b, mode: .add)
    }
    
    func sub() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        if a > b {
            return CalculateResult(left: a, right: b, answer: a - b, mode: .sub)
        }
        return CalculateResult(left: b, right: a, answer: b - a, mode: .sub)
    }
    
    func mul() -> CalculateResult {
        let a = Int.random(in: minValue...maxValue)
        let b = Int.random(in: minValue...maxValue)
        return CalculateResult(left: a, right: b, answer: a * b, mode: .mul)
    }
    
    func div() -> CalculateResult {
        let left = Int.random(in: 1...10)
        let rights = factors(left)
        let right = rights.randomElement() ?? 1
        return CalculateResult(left: left, right: right, answer: left / right, mode: .div)
    }
}

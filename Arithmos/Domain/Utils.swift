//
//  Add.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import Foundation

/// 約数を列挙する
func factors(_ num: Int) -> [Int] {
    var factorsArr = [Int]()
    for i in 1 ... Int(sqrt(Double(num))) {
        if num.isMultiple(of: i) {
            factorsArr.append(i)
            if num/i != i {
            factorsArr.append(num/i)
            }
        }
    }
    return factorsArr
}

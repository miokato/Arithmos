//
//  CalculateViewModel.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//
import SwiftUI

class CalculationViewModel: ObservableObject {
    @Published var value0: Int = 0
    @Published var value1: Int = 0
    @Published var correctAnswer: Int = 0
    @Published var answers: [Int] = [Int]()
    @Published var isCompleted: Bool = false
    
    var questionLabelText: String {
        return "\(questionCount)つめのもんだい"
    }
    
    var questionCount: Int = 0
    
    let minValue: Int = 0
    let maxValue: Int = 5
    let answerCount: Int = 5
    let maxQuestionCount: Int = 20
    let calculator = Calculator()
    var calculateMode: CalculateMode = .add
    
    func next() {
        if questionCount == maxQuestionCount {
            isCompleted = true
        }
        value0 = Int.random(in: minValue...maxValue)
        value1 = Int.random(in: minValue...maxValue)
        
        // 答えがマイナスの値にならないように大小関係を変更する
        if calculateMode == .div || calculateMode == .sub {
            if value0 < value1 {
                let temp = value0
                value0 = value1
                value1 = temp
            }
        }
        correctAnswer = calculator.calculate(a: value0, b: value1, mode: calculateMode)
        answers = getRandomValuesWithCorrectAnswer(count: answerCount)
        questionCount += 1
    }
    
    func clear() {
        questionCount = 0
        isCompleted = false
        next()
    }
    
    private func getRandomValuesWithCorrectAnswer(count: Int) -> [Int] {
        let answer = correctAnswer
        var answers = [Int]()
        for i in 0..<count {
            answers.append(answer + i)
        }
        answers.shuffle()
        return answers
    }
}

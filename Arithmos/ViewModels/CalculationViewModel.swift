//
//  CalculateViewModel.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//
import SwiftUI

class CalculationViewModel: ObservableObject {
    @Published var result: CalculateResult = .init(left: 0, right: 0, answer: 0, mode: .add)
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
    let calculator: Calculator
    var calculateMode: CalculateMode = .add
    
    init() {
        calculator = Calculator(minValue: minValue, maxValue: maxValue)
    }
    
    func next() {
        if questionCount == maxQuestionCount {
            isCompleted = true
        }
        
        result = calculator.calculate(mode: calculateMode)
        answers = getRandomValuesWithCorrectAnswer(count: answerCount)
        questionCount += 1
    }
    
    func clear() {
        questionCount = 0
        isCompleted = false
        next()
    }
    
    private func getRandomValuesWithCorrectAnswer(count: Int) -> [Int] {
        let answer = result.answer
        var answers = [Int]()
        for i in 0..<count {
            answers.append(answer + i)
        }
        answers.shuffle()
        return answers
    }
}

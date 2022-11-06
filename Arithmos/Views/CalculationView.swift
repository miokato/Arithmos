//
//  CalculateView.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import SwiftUI

struct CalculationView: View {
    @State private var showingModal = false
    @StateObject private var viewModel = CalculationViewModel()
    @State private var correctLabelText = "？？？"
    
    let calculateMode: CalculateMode
    private let soundService = SoundService()
    private let correctText = "⭕️ : あってるよ"
    private let incorrectText = "❌ : おしい"
    
    func showAnswer(answer: Int) {
        if answer == viewModel.result.answer {
            correctLabelText = correctText
            viewModel.next()
            soundService.playCorrect()
        } else {
            correctLabelText = incorrectText
            soundService.playIncorrect()
        }
        if viewModel.isCompleted {
            showingModal.toggle()

        }
    }
    
    var body: some View {
        VStack {
            Text(viewModel.questionLabelText)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            Text("\(correctLabelText)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            Spacer()
            Text("\(viewModel.result.left) \(viewModel.result.mode.simbolText) \(viewModel.result.right) = ?")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
                .padding()
            HStack {
                ForEach(0..<viewModel.answers.count, id: \.self) { i in
                    let answer = viewModel.answers[i]
                    Button("\(answer)") {
                        showAnswer(answer: answer)
                    }
                    .font(.largeTitle)
                    .buttonStyle(.borderedProminent)
                    .fullScreenCover(isPresented: $showingModal, onDismiss: {
                        viewModel.clear()
                    }, content: {
                        ResultView(isActive: $showingModal)
                    })
                }
            }
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.calculateMode = calculateMode
            viewModel.next()
        }
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView(calculateMode: .add)
    }
}

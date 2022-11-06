//
//  ResultView.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import SwiftUI

struct ResultView: View {
    @Binding var isActive: Bool
    let resultLabelText = "よくがんばったね☀️"
    let resetButtonLabelText = "もういちどやる"
    
    let soundService = SoundService()
    
    var body: some View {
        VStack {
            Spacer()
            Text(resultLabelText)
                .font(.largeTitle)
                .foregroundColor(.gray)
            Spacer()
            Button(resetButtonLabelText) {
                isActive = false
            }
            .font(.largeTitle)
            Spacer()
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                soundService.playCongratulation()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isActive: .constant(true))
    }
}


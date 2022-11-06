//
//  HomeView.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink {
                    CalculationView()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .foregroundColor(.gray)
                    Text("たしざん")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.gray)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

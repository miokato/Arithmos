//
//  HomeView.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import SwiftUI

struct HomeView: View {
    var operations: [CalculateMode] = [.add, .sub, .mul, .div, .all]
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(operations, id: \.self) { operation in
                        NavigationLink {
                            CalculationView(calculateMode: operation)
                        } label: {
                            Image(systemName: operation.systemName)
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundColor(.gray)
                            Text(operation.rawValue)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.gray)
                        }
                        .navigationTitle("けいさん")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  ShibaDogApp
//
//  Created by 渡邊魁優 on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ShibaData()
    var body: some View {
        List {
            ForEach(0..<viewModel.dogImages.count, id:  \.self) { index in
                AsyncImage(url: viewModel.dogImages[index]) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .onAppear(perform: viewModel.onApper)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

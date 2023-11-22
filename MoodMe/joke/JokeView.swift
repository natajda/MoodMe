//
//  JokeView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 04/02/2023.
//

import SwiftUI

struct JokeView: View {
    @StateObject var viewModel: JokeViewModel
    
    var body: some View {
        if (!viewModel.isLoaded) {
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    await viewModel.fetchJoke()
                }
        } else {
            VStack {
                Text(viewModel.jokeData!.joke)
                    .multilineTextAlignment(.leading)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontDesign(.monospaced)
                Button {
                    Task {
                        await viewModel.fetchJoke()
                    }
                } label: {
                    Label {
                        Text("Refresh").fontWeight(.thin)
                            .foregroundColor(.gray)
                    } icon: {
                        Image(systemName: "arrow.clockwise").foregroundColor(.gray)
                    }
                }.padding(.horizontal, 16)
                    .frame(alignment: .trailing)
            }
        }
    }
}

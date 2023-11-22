//
//  OverviewView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 04/02/2023.
//

import SwiftUI

struct OverviewView: View {
    @ObservedObject var viewModel: OverviewViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.currentDate)
                .font(.system(size: 60))
                .padding(.horizontal, 10)
                .fontDesign(.rounded)
                .onReceive(viewModel.clockTimer) { _ in
                    viewModel.currentDate = Date.now.toString(format: viewModel.timeFormat)
                }
            
            Text(Date.now, style: .date)
                .font(.system(size: 40))
                .padding(.horizontal, 10)
            
            Divider()
            
            Text("Today we celebrate " + viewModel.getTodaysNameday())
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
            
            Divider()
            
            JokeView(viewModel: JokeViewModel())
            
            Spacer()
            
        }.padding(.horizontal, 10)
    }
}


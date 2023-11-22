//
//  NewPlanView.swift
//  semestralka_NI
//
//  Created by Natália Pohanková on 16/06/2023.
//

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var viewModel: AddTodoViewModel
        
    var body: some View {
        List {
            HStack {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
                    .padding(.horizontal, 5)
                
                TextField("New Event", text: $viewModel.plan.title)
                    .font(.title2)
                
            }.padding(.vertical, 5)
            
            
            DatePicker("Date", selection: $viewModel.plan.date)
                .labelsHidden()
                .listRowSeparator(.hidden)
                .frame(alignment: .leading)
            
            
            TextField("Description", text: $viewModel.plan.description)
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 300, alignment: .topLeading)
        }
    }
    
}

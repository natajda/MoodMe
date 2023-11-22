//
//  AddTodoView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var viewModel: AddTodoViewModel
        
    var body: some View {
        List {
            HStack {
                Image(systemName: "checklist")
                    .imageScale(.large)
                    .foregroundColor(.pink)
                    .padding(.horizontal, 5)
                
                TextField("New Task", text: $viewModel.todo.title)
                    .font(.title2)
                
            }.padding(.vertical, 5)
            
            
            DatePicker("Date", selection: $viewModel.todo.date)
                .labelsHidden()
                .listRowSeparator(.hidden)
                .frame(alignment: .leading)
            
            
            TextField("Description", text: $viewModel.todo.description)
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 300, alignment: .topLeading)
        }
    }
    
}

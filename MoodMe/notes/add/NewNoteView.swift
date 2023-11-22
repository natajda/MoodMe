//
//  NewNoteView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 25/01/2023.
//

import SwiftUI

struct NewNoteView: View {    
    @ObservedObject var viewModel: NewNoteViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField("Let your thoughts out...", text: $viewModel.noteField, axis: .vertical)
                .padding(15)
                .frame(maxWidth: .infinity, minHeight: 300, alignment: .topLeading)
                .background(Color(.systemGray6))
                .cornerRadius(13)
            
            Button {
                viewModel.onSave()
                dismiss()
            } label: {
                Text("Save")
                    .foregroundColor(.pink)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .continuous
                        )
                        .stroke(.black, lineWidth: 2)
                    )
                
            }.disabled(viewModel.noteField.isEmpty)
            Spacer()
        }.padding(16)
    }
}

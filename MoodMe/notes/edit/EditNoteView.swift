//
//  EditNoteView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 30/01/2023.
//

import SwiftUI

struct EditNoteView: View {
    @ObservedObject var viewModel: EditNoteViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.note?.dateText ?? "")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fontWeight(.light)
                    .padding(.vertical, 4)
                
                Divider()
                
                TextField("", text: $viewModel.editedText, axis: .vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .onSubmit {
                        viewModel.note?.text = viewModel.editedText
                        viewModel.note?.date = Date.now
                        viewModel.note?.dateText = Note.toDateText()
                    }
            }
            Spacer()
        }
    }
}


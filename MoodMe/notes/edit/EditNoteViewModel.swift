//
//  EditNoteViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//
import SwiftUI

final class EditNoteViewModel: ObservableObject {
    typealias Dependencies = HasNotesService
    
    @Published var editedText: String = ""

    let notesStorage: NotesServicing

    let note: NoteEntity?
    
    let noteText: String
    
    init(dependecies: Dependencies, note: NoteEntity?, noteText: String) {
        self.notesStorage = dependecies.notesService
        self.note = note
        self.noteText = noteText
        self.editedText = noteText
    }

    func editNote() {
        notesStorage.editNote(note: note, newText: editedText)
    }
}

//
//  NotesServiceMock.swift
//  MoodMeTests
//
//  Created by Natália Pohanková on 23/06/2023.
//

import Foundation

@testable import MoodMe
import CoreData

final class NotesServiceMock: NotesServicing {
    
    var container: NSPersistentContainer
    
    var testStack: CoreDataTestStack
    
    var notesResponse: [MoodMe.NoteEntity] = []
    
    init(notesResponse: [MoodMe.NoteEntity] = []) {
        self.testStack = .init()
        self.container = testStack.container
        self.notesResponse = getSavedNotes()
    }
    
    func fetchData() {
        let request  = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            notesResponse = try testStack.context.fetch(request)
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)")
        }
    }
    
    func saveNote(noteField: String) {
        let note = NoteEntity(context: testStack.context)
        note.text = "New one"
        note.date = Date.now
        
        do {
            try testStack.context.save()
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)")
        }
    }
    
    func editNote(note: MoodMe.NoteEntity?, newText: String) {
        note?.text = newText
        note?.date = Date.now
        note?.dateText = Note.toDateText()
        
        do {
            try testStack.context.save()
        } catch {
            print("ERROR UPDATING CORE DATA:", error.localizedDescription)
        }
    }
    
    func deleteNote(at indexSet: IndexSet) {
        for index in indexSet {
            let note = notesResponse[index]
            testStack.context.delete(note)
        }
        do {
            try testStack.context.save()
        } catch {
            print("ERROR DELETING FROM CORE DATA:", error.localizedDescription)
        }
    }
    
    func getSavedNotes() -> [MoodMe.NoteEntity] {
        fetchData()
        return notesResponse
    }
    
}

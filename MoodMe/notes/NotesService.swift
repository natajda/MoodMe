//
//  PersistanceController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 31/01/2023.
//

import CoreData

class NotesService: ObservableObject, NotesServicing {
        
    @Published var savedNotes: [NoteEntity] = []
    
    private let viewContext: NSManagedObjectContext
    
    var container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container      
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        viewContext = container.viewContext
    }
    
    func fetchData() {
        let request  = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            savedNotes = try viewContext.fetch(request)
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)")
        }
    }
    
    func getSavedNotes() -> [NoteEntity] {
        return savedNotes
    }
    
    func saveNote(noteField: String) {
        let newNote = NoteEntity(context: viewContext)
        newNote.id = UUID().uuidString
        newNote.text = noteField
        newNote.date = Date.now
        newNote.dateText = Note.toDateText()
        
        do {
            try viewContext.save()
            fetchData()
        } catch {
            print("ERROR SAVING TO CORE DATA:", error.localizedDescription)
        }
    }
    
    func editNote(note: NoteEntity?, newText: String) {
        note?.text = newText
        note?.date = Date.now
        note?.dateText = Note.toDateText()
        
        do {
            try viewContext.save()
            fetchData()
        } catch {
            print("ERROR UPDATING CORE DATA:", error.localizedDescription)
        }
    }
    
    func deleteNote(at indexSet: IndexSet) {
        for index in indexSet {
            let note = savedNotes[index]
            viewContext.delete(note)
        }
        do {
            try viewContext.save()
            fetchData()
        } catch {
            print("ERROR DELETING FROM CORE DATA:", error.localizedDescription)
        }
    }
}

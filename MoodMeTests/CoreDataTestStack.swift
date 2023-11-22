//
//  CoreDataTestStack.swift
//  MoodMeTests
//
//  Created by Natália Pohanková on 23/06/2023.
//

import Foundation
import CoreData

@testable import MoodMe

struct CoreDataTestStack {
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "NotesContainer")
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        context = container.viewContext
    }
    
}

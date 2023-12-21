//
//  NoteEntityViewModel.swift
//  Note-Taking
//
//  Created by Md. Masud Rana on 12/20/23.
//

import CoreData
import Foundation
import UIKit

class NoteEntityViewModel: ObservableObject {
    @Published var noteEntities: [NoteEntity] = []

    private let context = CoreDataManager.shared.persistentContainer.viewContext

    func fetchNotes() {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")

        do {
            noteEntities = try context.fetch(request)
        } catch {
            print("Error fetching. \(error)")
        }
    }

    func updateNote(note: Note) {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        request.predicate = NSPredicate(format: "noteId == %@", note.id as CVarArg)

        do {
            let results = try context.fetch(request)

            if let noteEntity = results.first {
                noteEntity.id = note.id
                noteEntity.text = note.text
                noteEntity.date = note.date
                noteEntity.title = note.title

                saveData()
            } else {
                print("Note with ID \(note.id) not found.")
            }
        } catch {
            print("Error fetching note. \(error)")
        }
    }

    func deleteNoteWithId(_ noteId: UUID) {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        request.predicate = NSPredicate(format: "noteId == %@", noteId as CVarArg)

        do {
            let results = try context.fetch(request)

            if let noteToDelete = results.first {
                // Remove the found entity from the context
                context.delete(noteToDelete)

                // Save the changes to the Core Data context
                saveData()
            } else {
                print("Note with ID \(noteId) not found.")
            }
        } catch {
            print("Error fetching note. \(error)")
        }
    }

    func addNote(note: Note) {
        let noteEntity = NoteEntity(context: context)

        noteEntity.id = note.id
        noteEntity.text = note.text
        noteEntity.date = note.date
        noteEntity.title = note.title
        saveData()
    }

    func saveData() {
        do {
            try context.save()
            fetchNotes()
        } catch {
            print("Data saving error: \(error)")
        }
    }
}

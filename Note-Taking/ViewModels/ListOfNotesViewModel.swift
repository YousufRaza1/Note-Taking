//
//  ListOfNotesViewModel.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import Foundation

class ListOfNotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        // API called to get the remote notes
        notes = Note.mockNotes()
    }
    
    func sortBydateAssending() {
        notes = notes.sorted { $0.date < $1.date }
    }
    
    func sortBydateDescending() {
        notes = notes.sorted { $0.date > $1.date }
    }
    
    func sortByTitleDescending() {
        notes = notes.sorted { $0.title > $1.title }
    }
    
    func sortByTitleAssending() {
        notes = notes.sorted { $0.date < $1.date }
    }
}

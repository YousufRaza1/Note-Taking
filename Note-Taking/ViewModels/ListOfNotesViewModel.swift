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
        //API called to get the remote notes
        self.notes = Note.mockNotes()
    }
    
}

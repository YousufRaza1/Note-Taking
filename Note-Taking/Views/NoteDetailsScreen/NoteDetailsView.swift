//
//  NoteDetailsView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import SwiftUI

struct NoteDetailsView: View {
    @Binding var note: Note
    
    init(note: Binding<Note>) {
        self._note = note
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Title")

                    TextEditor(text: $note.title)
                        .frame(height: 100)
                        .cornerRadius(5)

                    Text("Description")

                    TextEditor(text: $note.text)
                        .frame(height: 500)
                }
                .padding()
            }
        }
    }
}

#Preview {
    NoteDetailsView(note: .constant(Note()))
}

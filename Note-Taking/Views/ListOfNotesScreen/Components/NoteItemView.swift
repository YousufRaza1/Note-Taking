//
//  NoteItemView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//

import SwiftUI

struct NoteItemView: View {
    @Binding var note: Note
    init(note: Binding<Note>) {
        self._note = note
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("\(note.title)")
                    .font(.system(.headline, weight: .bold))
                    .lineLimit(1)

                Spacer()

                Text("\(note.date, style: Text.DateStyle.date)")
                    .font(.system(.footnote))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
            }

            Text("\(note.text)")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
}

#Preview {
    NoteItemView(note: .constant(Note()))
}

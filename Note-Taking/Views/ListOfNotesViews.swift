//
//  ListOfNotesViews.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var attachment: Data? // You can use Data type to store binary data (e.g., image)
    var text: String
    var link: URL?
    var date: Date = .now
}

struct ListOfNotesViews: View {
    @State private var notes: [Note] = [
        Note(title: "Meeting Notes", attachment: nil, text: "Discussed project timelines and goals.", link: URL(string: "https://example.com/meeting")),
        Note(title: "Recipe Ideas", attachment: nil, text: "Consider trying the new pasta recipe with a twist.", link: nil),
        Note(title: "Vacation Plans", attachment: Data(), text: "Check flight availability and hotel options.", link: URL(string: "https://example.com/vacation")),
        // Add more notes as needed
    ]
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(notes) { note in
                        NavigationLink {
                            NoteDetailsView()
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(note.title)")
                                        .font(.system(.body, weight: .bold))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                    Text("\(note.date.formatted())")
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                }

                                VStack {
                                    Text("\(note.text)")
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                }

                                VStack {}
                            }
                        }
                    }
                    .onDelete(perform: removeRows)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Press Me") {
                        print("Pressed")
                    }
                }
            }
        }
    }

    private func removeRows(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfNotesViews()
}

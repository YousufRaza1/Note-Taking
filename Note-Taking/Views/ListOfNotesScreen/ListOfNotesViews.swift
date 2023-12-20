//
//  ListOfNotesViews.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import SwiftUI

struct ListOfNotesViews: View {
//    @State private var notes: [Note] = [
//        //        Note(title: "Meeting Notes", attachment: nil, text: "Discussed project timelines and goals.", link: URL(string: "https://example.com/meeting")),
////        Note(title: "Recipe Ideas", attachment: nil, text: "Consider trying the new pasta recipe with a twist.", link: nil),
////        Note(title: "Vacation Plans", attachment: Data(), text: "Check flight availability and hotel options.", link: URL(string: "https://example.com/vacation")),
////        // Add more notes as needed
//    ]
    @ObservedObject private var viewModel = ListOfNotesViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.notes.isEmpty {
                    List {
                        ForEach(viewModel.notes) { note in
                            NavigationLink {
                                NoteDetailsView()
                            } label: {
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Text("\(note.title)")
                                            .font(.system(.headline, weight: .bold))

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
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                        }
                        .onDelete(perform: removeRows)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                } else {
                    EmptyListScreen()
                }
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
        viewModel.notes.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfNotesViews()
}

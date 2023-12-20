//
//  ListOfNotesViews.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import SwiftUI

struct ListOfNotesViews: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ListOfNotesViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.notes.isEmpty {
                    List {
                        ForEach($viewModel.notes) { note in
                            NavigationLink {
                                NoteDetailsView(note: note)
                            } label: {
                               NoteItemView(note: note)
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .cornerRadius(15)
                            .shadow(
                                color: colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2),
                                radius: 7,
                                x: 0,
                                y: 2
                            )
                        }
                        .onDelete(perform: removeRows)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                } else {
                    EmptyListScreen(viewModel: viewModel)
                }
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.notes.append(Note(title: "New Note", text: "Description"))
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(6)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Menu("Filter By") {
                        Button("Date Assending", action: viewModel.sortBydateAssending)
                        Button("Date Desending", action: viewModel.sortBydateDescending)
                        Button("Title Assending", action: viewModel.sortBydateAssending)
                        Button("Title Desending", action: viewModel.sortByTitleDescending)
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


//
//  NotesModel.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import Foundation
import SwiftUI

class Note: ObservableObject, Identifiable {
    let id = UUID()
    @Published var title: String
    @Published var attachment: [UIImage]
    @Published var text: String
    @Published var link: URL?
    @Published var date: Date
    init(
        title: String = "",
        attachment: [UIImage] = [],
        text: String = "",
        link: URL? = nil,
        date: Date = .now
    ) {
        self.title = title
        self.attachment = attachment
        self.text = text
        self.link = link
        self.date = date
    }
}

extension Note {
    
    //mock data we can use instant of api because we dont have appropa
    
    static func mockNotes() -> [Note] {
        return [
            Note(
                title: "Meeting Notes",
                attachment: [],
                text: "Discussed project updates and timelines.",
                link: URL(string: "https://example.com/meeting-notes"),
                date: Date.now
            ),
            Note(
                title: "Ideas for Design",
                attachment: [],
                text: "Brainstormed ideas for the new app design.",
                link: URL(string: "https://example.com/design-ideas"),
                date: Date.now
            ),
            Note(
                title: "Personal Journal",
                attachment: [],
                text: "Reflecting on the day and setting goals for tomorrow.",
                date: Date.now
            )
        ]
    }
}

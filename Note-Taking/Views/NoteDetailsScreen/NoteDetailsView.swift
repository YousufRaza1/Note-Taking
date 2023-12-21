//
//  NoteDetailsView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import PhotosUI
import Swift
import SwiftUI
import UIKit

struct NoteDetailsView: View {
    @FocusState private var isUsernameFocused: Bool

    @Binding var note: Note

    @State private var showAttachmentAddDialog = false
    @State private var showImageCapturer = false
    @State private var showPhotoLibrary = false
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var loading = false

    init(note: Binding<Note>) {
        self._note = note
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Spacer()
                        Text("\(note.date, style: Text.DateStyle.date)")
                            .font(.system(.footnote))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Spacer()
                    }

                    Text("Title")

                    TextEditor(text: $note.title)
                        .frame(height: 100)
                        .cornerRadius(5)
                        .focused($isUsernameFocused)

                    Text("Description")

                    TextEditor(text: $note.text)
                        .frame(height: 500)
                        .focused($isUsernameFocused)

                    Text("\(loading ? "True" : "False")")

                    ForEach($note.attachment) { uiImage in
                        UiImageView(
                            note: $note,
                            uiImage: uiImage
                        )
                    }

                    HStack {
                        Spacer()
                        Button("Add New Image") {
                            self.showAttachmentAddDialog = true
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                    .padding(.bottom, showAttachmentAddDialog ? 50 : 20)
                }
                .padding()
                .onTapGesture {
                    self.isUsernameFocused = false
                }
                .confirmationDialog(
                    "Add Attachment",
                    isPresented: $showAttachmentAddDialog
                ) {
                    Button {
                        self.showImageCapturer = true
                    } label: {
                        Text("Take New Photo")
                            .foregroundColor(Color.label)
                    }

                    Button {
                        self.showPhotoLibrary = true
                    } label: {
                        Text("Choose Photo")
                            .foregroundColor(Color.label)
                    }

                    Button("Cancel", role: .cancel) {}
                }
            }
        }
        .photosPicker(
            isPresented: $showPhotoLibrary,
            selection: $selectedPhoto,
            matching: .images
        )
        .onChange(of: selectedPhoto) {
            Task {
                loading = true
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        note.attachment.append(ImageModel(image: uiImage))
                        loading = false
                    }
                    selectedPhoto = nil
                } else {
                    //notify user
                }
            }
        }
    }
}

#Preview {
    NoteDetailsView(note: .constant(Note()))
}

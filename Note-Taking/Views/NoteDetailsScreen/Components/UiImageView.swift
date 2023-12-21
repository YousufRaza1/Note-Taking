//
//  UiImageView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//

import SwiftUI

struct UiImageView: View {
    @Binding var note: Note
    @Binding var uiImage: ImageModel
    var body: some View {
        ZStack {
            Image(uiImage: uiImage.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        if let index = note.attachment.firstIndex(of: uiImage) {
                            note.attachment.remove(at: index)
                            self.note = note
                        } else {
                            // notifly user
                        }
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.title)
                            .foregroundStyle(Color.red)
                            .padding(10)
                    }
                }
                .padding(.top, 5)
                Spacer()
            }
        }
    }
}

// #Preview {
////    UiImageView()
// }

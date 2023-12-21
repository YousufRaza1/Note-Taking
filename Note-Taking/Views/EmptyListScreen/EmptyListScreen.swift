//
//  ListOfNotesViews.swift
//  Note-Taking
//
//  Created by Yousuf on 12/19/23.
//

import SwiftUI

struct EmptyListScreen: View {
    @State private var animate: Bool = false
    @ObservedObject var viewModel: ListOfNotesViewModel

    init(viewModel: ListOfNotesViewModel = ListOfNotesViewModel()) {
        self.viewModel = viewModel
    }

    private let colorFrom: Color = .blue.opacity(0.7)
    private let colorTo: Color = .blue
    private let description = "Are you a productive person? I think you should click the add button and add a bunch of notes."

    var body: some View {
        VStack(spacing: 10) {
            Text("No Notes")
                .font(.system(.title3, weight: .semibold))

            Text(description)
                .padding(.bottom)

            Button(action: {
                viewModel.notes.append(Note(title: "New Note", text: "Description"))
            }, label: {
                Text("Add new Notes 🥳")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .background(animate ? colorFrom : colorTo)
                    .cornerRadius(30)
            })
            .padding(.horizontal, animate ? 30 : 45)
            .shadow(
                color: animate ? colorFrom.opacity(0.9) : colorTo.opacity(0.7),
                radius: animate ? 30 : 10,
                x: 0,
                y: animate ? 50 : 30
            )
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)

            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct EmptyListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListScreen()
    }
}

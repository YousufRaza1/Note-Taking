//
//  LockedScreenView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/20/23.
//

import SwiftUI

struct LockedScreenView: View {
    private let action: () -> Void
    init(
        action: @escaping () -> Void
    ) {
        self.action = action
    }

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Image(systemName: "lock.circle.fill")
                    .font(.system(size: 60))
                    .padding(20)

                Text("Note Taking App is Locked")
                    .font(.system(size: 30))
                    .bold()

                Text("Unlock with face ID to open Notes")

                Spacer()
                Spacer()

                Button(action: action) {
                    Text("Use Face ID")
                        .foregroundStyle(Color.white)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ignoresSafeAreaEdges: .all)
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    LockedScreenView {}
}

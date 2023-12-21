//
//  SplashScreen.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            VStack {
                Text("📝")
                    .font(.system(size: 40))
                Text("Note Taking App")
                    .font(.title)
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ignoresSafeAreaEdges: .all)
        .background(Color(UIColor.systemBackground))
    }
}

#Preview {
    SplashScreen()
}

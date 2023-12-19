//
//  HomeScreen.swift
//  Note-Taking
//
//  Created by Yousuf on 12/20/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            if viewModel.showSplashScreen {
                Text("splash is showing")
            } else {
                if viewModel.isAuthenticated {
                    ListOfNotesViews()
                } else {}
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.authenticate()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                viewModel.showSplashScreen = false
            }
        }
    }
}

#Preview {
    HomeScreen()
}

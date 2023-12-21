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
            if viewModel.isAuthenticated {
                if viewModel.showSplashScreen {
                    SplashScreen()
                } else {
                    ListOfNotesViews()
                }
            } else {
                LockedScreenView {
                    viewModel.authenticate()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.authenticate()
        }
    }
}

#Preview {
    HomeScreen()
}

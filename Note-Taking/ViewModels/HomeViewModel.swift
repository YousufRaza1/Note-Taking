//
//  HomeViewModel.swift
//  Note-Taking
//
//  Created by Yousuf on 12/20/23.
//

import Foundation
import LocalAuthentication

class HomeViewModel: ObservableObject {
    @Published var showSplashScreen = true
    @Published var isAuthenticated = false

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(
            .deviceOwnerAuthentication,
            error: &error
        ) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(
                .deviceOwnerAuthentication,
                localizedReason: reason
            ) { success, _ in
                // authentication has now completed
                if success {
                    // authenticated successfully

                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.showSplashScreen = false
                    }
                } else {
                    print("authentication failed")

                    // there was a problem
                }
            }
        } else {
            print("not enrolled")
            // no biometrics
        }
    }
}

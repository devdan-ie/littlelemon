//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/15/23.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let user = UserData()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if user.isLoggedIn() {
                    MainPage(user: user)
                } else {
                    OnboardingPage(user: user)
                }
            }
        }
    }
}

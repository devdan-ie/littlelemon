//
//  OnboardingPage.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import Foundation
import SwiftUI

struct OnboardingPage: View {
    let user: UserData
    @State private var name: String = ""
    @State private var email: String = ""
    
    @State private var showMainPage = false
    
    
    var body: some View {
        VStack {
            NavigationBarView(user: user)
            HeroSection()
            
            VStack (alignment: .leading, spacing: 20) {
                Text("Name *")
                TextField("Type your name here", text: $name)
                
                Text("Email *")
                TextField("Type your email here", text: $email)
                    .keyboardType(.emailAddress)
                
                NavigationLink(destination: MainPage(user: user), isActive: $showMainPage) { EmptyView() }

                AppButton(type: .yellow, text: "Confirm") {
                    if !name.isEmpty && !email.isEmpty {
                        let emailPreferences = EmailPreferences(orderStatuses: true,
                                                     passwordChanges: true,
                                                     specialOffers: true,
                                                     newsletters: true)
                        user.user = User(firstName: name,
                                         lastName: "",
                                         email: email,
                                         isLoggedIn: true,
                                         emailPreferences: emailPreferences)
                        user.saveUser()
                        
                        showMainPage = true
                    }
                }
            }.padding(20)
        }
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage(user: UserData())
    }
}

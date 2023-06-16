//
//  AppStorage.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import SwiftUI

struct EmailPreferences: Codable {
    let orderStatuses: Bool
    let passwordChanges: Bool
    let specialOffers: Bool
    let newsletters: Bool
}

struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let isLoggedIn: Bool
    let emailPreferences: EmailPreferences
}

class UserData {
    var user: User?
    
    init() {
        loadUser()
        if user == nil {
            let email = EmailPreferences(orderStatuses: false,
                                         passwordChanges: false,
                                         specialOffers: false,
                                         newsletters: false)
            self.user = User(firstName: "",
                             lastName: "",
                             email: "",
                             isLoggedIn: false,
                             emailPreferences: email)
        }
        saveUser()
    }
    
    func saveUser() {
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(self.user) else { return }
        UserDefaults.standard.set(encodedData, forKey: "user")
        UserDefaults.standard.synchronize()
    }
        
    func loadUser() {
        guard let data = UserDefaults.standard.data(forKey: "user") else { return }
        let decoder = JSONDecoder()
        guard let decodedUser = try? decoder.decode(User.self, from: data) else { return }
        self.user = decodedUser
    }
    
    func isLoggedIn() -> Bool {
        return user?.isLoggedIn ?? false
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        self.user = nil
    }
}

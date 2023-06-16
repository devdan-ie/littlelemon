//
//  Header.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import SwiftUI

struct NavigationBarView: View {
    let user: UserData
    
    var body: some View {
        ZStack {
            HStack {
                AppLogo()
            }
            HStack {
                Spacer()
                ProfilePicture(user: user)
                    .padding(10)
            }
        }
    }
}

struct AppLogo: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 50)
    }
}

struct ProfilePicture: View {
    let user: UserData
    
    var body: some View {
        NavigationLink(destination: ProfilePage(user: user)) {
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(user: UserData())
    }
}

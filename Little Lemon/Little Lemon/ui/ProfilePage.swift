//
//  ProfilePage.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import SwiftUI


struct ProfilePage: View {
    let user: UserData

    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBarView(user: user)
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Personal Information")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.darkGray)
                    ProfileChangeRemove(user: user)
                    PersonalDetails()
                    EmailNotifications()
                    ProfileBottomActions(user: user)
                }
                .padding(10)
                .frame(maxWidth: .infinity)
            }
            
        }.frame(maxWidth: .infinity)
    }
}

struct EmailNotifications: View {
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email Notifications")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(AppColors.darkGray)
            Checkbox(isChecked: $orderStatuses, label: "Order Statuses")
            Checkbox(isChecked: $passwordChanges, label: "Password Changes")
            Checkbox(isChecked: $specialOffers, label: "Special Offers")
            Checkbox(isChecked: $newsletter, label: "Newsletters")
        }
 
    }
}

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(AppColors.darkGreen)
                .background(configuration.isOn ? AppColors.white : Color.clear)
                .padding(2)

            configuration.label
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

struct Checkbox: View {
    @Binding var isChecked: Bool
    let label: String

    var body: some View {
        Toggle(isOn: $isChecked) {
            Text(label)
        }
        .toggleStyle(CheckboxStyle())
    }
}

struct ProfileChangeRemove: View {
    let user: UserData
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Avatar")
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundColor(AppColors.darkGray)
            HStack {
                ProfilePicture(user: user)
                AppButton(type: .green, text: "Change") {
                    
                }
                AppButton(type: .white, text: "Remove") {
                    
                }
            }
        }.padding(0)
    }
}

struct ProfileBottomActions: View {
    let user: UserData
    @State private var showMainPage = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: OnboardingPage(user: user),
                           isActive: $showMainPage) { EmptyView() }
            
            
            AppButton(type: .yellow, text: "Log out") {
                user.logout()
                showMainPage = true
            }
            HStack {
                AppButton(type: .white, text: "Discard Changes") {
                    
                }
                AppButton(type: .green, text: "Save Changes") {
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct PersonalDetails: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        VStack (alignment: .leading) {
            Text("First Name")
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundColor(AppColors.darkGray)
            TextField("", text: $firstName)
                .textFieldStyle(AppTextFieldStyle())
            
            Text("Last Name")
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundColor(AppColors.darkGray)
            TextField("", text: $lastName)
                .textFieldStyle(AppTextFieldStyle())
            
            Text("Email")
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundColor(AppColors.darkGray)
            TextField("", text: $email)
                .textFieldStyle(AppTextFieldStyle())
            
            Text("Phone Number")
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundColor(AppColors.darkGray)
            TextField("", text: $phoneNumber)
                .textFieldStyle(AppTextFieldStyle())
        }
        .padding(10)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(user: UserData())
//        ProfileBottomActions()
    }
}

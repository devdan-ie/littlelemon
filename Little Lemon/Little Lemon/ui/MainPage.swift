//
//  ContentView.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/15/23.
//

import SwiftUI


struct MainPage: View {
    let user: UserData
    var body: some View {
        VStack {
            NavigationBarView(user: user)
            HeroSection()
            MenuBreakdown()
            MenuList()
        }
    }
}





struct MenuCategory: Identifiable {
    let id = UUID()
    let title: String
}

struct MenuItem: Identifiable {
    let id = UUID()
    let category: MenuCategory
    let title: String
    let price: Float
    let description: String
    let imageName: String
    
    var displayPrice: String {
        String(format: "$%.2f", price)
    }
}

struct MenuBreakdown: View {
    let categories = [
        "Lunch",
        "Mains",
        "Deserts",
        "A La Cart",
        "Specials",
        "Drinks"
    ].map { title in
        MenuCategory(title: title)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Order for Delivery".uppercased())
                .bold()
                .font(.system(size: 20))
                .padding(10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories) { item in
                        Button(action: {
                                    // Action when the button is tapped
                                }) {
                                    Text(item.title)
                                }
                                .buttonStyle(PillButtonStyle())
                    }
                }
            }
            
        }.padding(10)
    }
}

let lunchCategory = MenuCategory(title: "Lunch")
let pasta = MenuItem(category: lunchCategory,
                        title: "Pasta",
                        price: 20,
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        imageName: "Pasta")

let fish = MenuItem(category: lunchCategory,
                        title: "Fish",
                        price: 30,
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        imageName: "Grilled fish")



let items: [MenuItem] = [pasta, fish, pasta, fish, pasta, fish]


struct MenuList: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(items) { item in
                    HStack {
                        VStack (alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .bold()
                                .lineLimit(1)
                                .foregroundColor(AppColors.black)
                            Text(item.description)
                                .lineLimit(2)
                                .foregroundColor(AppColors.darkGray)
                            Text(item.displayPrice)
                                .lineLimit(1)
                                .foregroundColor(AppColors.darkGray)
                                .bold()
                        }
                        .padding(10)
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .cornerRadius(2)
                            .padding(10)
                    }
                }
            }
        }
    }
}

struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundColor(AppColors.darkGray)
            .background(AppColors.lightGray)
            .cornerRadius(20)
    }
}










struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(user: UserData())
    }
}

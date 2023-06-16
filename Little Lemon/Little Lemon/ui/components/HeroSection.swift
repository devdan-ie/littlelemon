//
//  HeroSection.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        ZStack {
            AppColors.darkGreen
            
            VStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    Spacer().frame(height: 10)
                    Text("Little Lemon")
                        .foregroundColor(AppColors.yellow)
                        .font(.system(size: 35))
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                .padding([.leading, .trailing], 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top) {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .padding(10)
                        .foregroundColor(.white)
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding(10)
                }
            }
            
        }
        .fixedSize(horizontal: false, vertical: true)
        
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}

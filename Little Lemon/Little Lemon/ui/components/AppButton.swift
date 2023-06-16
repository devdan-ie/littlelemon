//
//  AppButton.swift
//  Little Lemon
//
//  Created by Danilo Gomes on 6/16/23.
//

import SwiftUI

enum AppButtonType {
    case white
    case green
    case yellow
}

struct AppButton: View {
    let type: AppButtonType
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text).frame(maxWidth: .infinity)
        }
        .buttonStyle(AppButtonStyle(type: type))
        
    }
}




struct AppButtonStyle: ButtonStyle {
    let type: AppButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        switch (type) {
            case .white:
                return getStyle(configuration: configuration,
                                textColor: AppColors.darkGray,
                                backgroundColor: AppColors.white,
                                borderColor: AppColors.darkGreen)
                
            case .green:
                return getStyle(configuration: configuration,
                                textColor: AppColors.white,
                                backgroundColor: AppColors.darkGreen,
                                borderColor: AppColors.darkGreen)
                
            case .yellow:
            return getStyle(configuration: configuration,
                            textColor: AppColors.darkGray,
                            backgroundColor: AppColors.yellow,
                            borderColor: AppColors.darkGray)
        }
        
        

    }
    
    func getStyle(configuration: Configuration,
                  textColor: Color,
                  backgroundColor: Color,
                  borderColor: Color)  -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(borderColor, lineWidth: 1))
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(type: .white, text: "Confirm") {
            
        }
    }
}

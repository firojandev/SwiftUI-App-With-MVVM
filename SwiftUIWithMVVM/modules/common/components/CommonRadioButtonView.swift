//
//  CommonRadioButtonView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import SwiftUI

struct CommonRadioButtonView: View {
    let title: String
    @Binding var isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(isSelected ? .red : .primary)
                
                if isSelected {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                } else {
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 20, height: 20)
                }
            }
           
        }
        .buttonStyle(PlainButtonStyle())
    }
}


//Shape with only Text
//Button(action: action) {
//    Text(title)
//        .foregroundColor(.white) // Text color for readability
//        .padding()
//        .background(isSelected ? Color.red : Color.green) // Background color based on selection
//        .cornerRadius(8) // Rounded corners for aesthetics
//        .frame(width: 110, height: 40) // Fixed size for rectangles
//}
//.buttonStyle(PlainButtonStyle())

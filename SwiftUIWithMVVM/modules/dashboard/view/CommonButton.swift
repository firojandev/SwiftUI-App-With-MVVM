//
//  CommonButton.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 9/6/24.
//

import SwiftUI

struct CommonButton: View {
    var title:String
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20.0)
                .padding(.horizontal)
          
        }
    }
}

struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton(title: "Title")
    }
}

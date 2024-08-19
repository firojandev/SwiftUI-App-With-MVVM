//
//  MyCardView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 19/8/24.
//

import SwiftUI

struct MyCardView: View {
    let title: String
    let subtitle: String
    let changePasswordAction: () -> Void
    let supTPAction: () -> Void
    let billAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Button(action: changePasswordAction) {
                    Text("Change Password")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                Button(action: supTPAction) {
                    Text("TP")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                Button(action: billAction) {
                    Text("Bill")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

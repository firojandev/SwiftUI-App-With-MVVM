//
//  MenuItemRowView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import SwiftUI

struct MenuItemRowView: View {
    let item: MenuItem
    
    let userAction: () -> Void
    
    var body: some View {
        VStack {
            Button(action: userAction) {
                VStack {
                    
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 75, height: 75)
                        
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                    }
                    
                    Text(item.title)
                        .font(.caption)
                        .foregroundColor(.black)
                    
                }
                
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
    }
}

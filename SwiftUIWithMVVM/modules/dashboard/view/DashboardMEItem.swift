//
//  DashboardMEItem.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 9/6/24.
//

import SwiftUI

struct DashboardMEItem: View {
    
    var mDCR:String
    var eDCR:String
    
    var body: some View {
        
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 100)
                    
                    Text("0")
                        .foregroundColor(.white)
                }
                
                Text("Morning DCR")
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
            }
            Spacer()
            VStack {
                VStack {
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.cyan)
                            .frame(width: 100, height: 100)
                        
                        Text("0")
                            .foregroundColor(.white)
                    }
                    
                    Text("Evening DCR")
                        .padding()
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                }
            }
            
        }
        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
        .background(Color.white)
        .cornerRadius(20.0)  // Rounded corners
        .shadow(radius: 5)  // Shadow for card-like effect
        .padding(.horizontal)
        
    }
}

struct DashboardMEItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardMEItem(mDCR:"0", eDCR:"10")
    }
}

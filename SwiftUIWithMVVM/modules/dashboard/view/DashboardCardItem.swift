//
//  DashboardCardItem.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 6/6/24.
//

import SwiftUI

struct DashboardCardItem: View {
    
    var cntVal:String
    var cntTitle:String
    var title:String
    var offSetVal:Int
    
    var body: some View {
        HStack {
            Image(systemName: "gear")
            VStack {
                HStack {
                    Text(cntVal)
                        .foregroundColor(.black)
                    Spacer() // Add a spacer to push the text to the leading edge
                }
                HStack {
                    Text(cntTitle).foregroundColor(.gray)
                    Spacer()
                }
                         
             }
             Spacer()
             Text(title)
            .padding()
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            )
             // .clipShape(RoundedRectangle(cornerRadius: 10.0))
             
             }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .background(Color.white)
            .cornerRadius(20.0)  // Rounded corners
            .shadow(radius: 5)  // Shadow for card-like effect
            .padding(.horizontal)
            .offset(y:CGFloat(offSetVal))
    }
}

struct DashboardCardItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCardItem(cntVal: "10", cntTitle: "Cnt Title", title: "Main Title",offSetVal: -30)
    }
}

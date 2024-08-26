//
//  TpColleageRowView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import SwiftUI

struct TpColleageRowView: View {
    
    var colleageModel: ColleageModel
    var userAction: () -> Void
    
    var body: some View {
        Button(action: userAction) {
            VStack {
                VStack {
                    Text(colleageModel.name)
                        .customeTextStyle()
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray.opacity(0.4))
                .cornerRadius(5)
                    
                HStack {
                    HStack {
                        showTextView(text: colleageModel.designation)
                        showTextView(text: colleageModel.userId)
                    }
                    showTextView(text: colleageModel.market)
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .background(Color.teal.opacity(0.05))
            .frame(maxWidth: .infinity)
            .cornerRadius(5)
        }
    }
    
    
}

struct showTextView: View{
    var text:String
    var body: some View {
        VStack {
            Text(text)
                .customeTextStyle().frame(maxWidth: .infinity)
        }
        .background(Color.gray.opacity(0.4))
        .cornerRadius(5)
    }
}


struct TpColleageRowView_Previews: PreviewProvider {
    static var previews: some View {
        TpColleageRowView(colleageModel:ColleageModel(
            userId: "MIO1", name: "MIO Name1", designation: "MIO", market: "MIO Market 1"
        ), userAction:{})
    }
}

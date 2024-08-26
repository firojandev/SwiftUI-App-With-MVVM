//
//  MioTpRowView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import SwiftUI

struct MioTpRowView: View {
    var tp: ColleageTP
    var body: some View {
        //Mark: - Main VStack
        VStack {
            //Mark: - Row header
            HStack{
                Text("\(tp.date),").foregroundColor(Color.white).customStyle()
                Text("Morning").foregroundColor(Color.white).customStyle()
                Spacer()
                Text("Evening").foregroundColor(Color.white).customStyle()
            }//Mark: - Row header
            .padding()
            .background(Color.green)
            
            //Mark: - row body
            HStack {
                //Mark: - Monrning - left
                VStack (alignment: .leading) {
                    Text(tp.mType).customStyle().foregroundColor(.red)
                    Text(tp.mAddress).customStyle()
                    Text(tp.eReportTime).customStyle()
                    Text(tp.mAddress).customStyle()
                    Text(tp.mLocation).customStyle()
                    
                }//: - Monrning - left
                .padding(.leading,10)
                
                Spacer()
                //Mark: - Evening - Right
                VStack (alignment: .trailing){
                    Text(tp.eType).customStyle().foregroundColor(.red)
                    Text(tp.eAddress).customStyle()
                    Text(tp.eReportTime).customStyle()
                    Text(tp.eAddress).customStyle()
                    Text(tp.eLocation).customStyle()
                }//: - Evening - Right
                .padding(.trailing,10)
                
            }//: - row body
            .padding(.bottom,10)
            
        }//: - Main VStack
        .background(Color.white)
        .cornerRadius(5)
        .padding(.horizontal)
    }
}

//struct MioTpRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MioTpRowView()
//    }
//}

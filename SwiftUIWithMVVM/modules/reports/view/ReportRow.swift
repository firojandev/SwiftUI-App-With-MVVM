//
//  ReportRow.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 4/9/24.
//

import SwiftUI

struct ReportRow: View {
    //Pass model here
    //var tpModel: TpModel
    
    var body: some View {
        HStack (spacing:0) {
            CardRow(label:"Name", title:"Altaf",bgColor: Color.ColorLightGray)
            CardRow(label:"Number", title:"1",bgColor: Color.ColorLightViolet)
            
            CardRow(label:"Pass", title:"0",bgColor: Color.ColorLightGray)
            CardRow(label:"Receive", title:"1",bgColor: Color.ColorLightViolet)
        }
        
    }
}

struct CardRow: View {
    var label:String
    var title:String
    var bgColor:Color
    var body: some View {
        HStack {
            VStack {
                Text(label).textLabel().padding(EdgeInsets.init(top: 8, leading: 8, bottom: 1, trailing: 8))
                Text(title).textValue().padding(EdgeInsets.init(top: 1, leading: 8, bottom: 8, trailing: 8))
            }
            .customBackgroundOne(color: bgColor)
        }
    }
}


struct ReportRow_Previews: PreviewProvider {
    static var previews: some View {
        ReportRow()
    }
}

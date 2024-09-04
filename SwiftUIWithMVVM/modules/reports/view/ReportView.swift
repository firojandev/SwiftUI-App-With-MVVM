//
//  ReportView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 4/9/24.
//

import SwiftUI

struct ReportView: View {
    @EnvironmentObject var navState: NavState
    
    var body: some View {
        ZStack {
            Color.colorLimeLight.ignoresSafeArea(.all)
            VStack {
                ScrollView (.horizontal){
                    ReportRow()
                    ReportRow()
                    ReportRow()
                    ReportRow()
                    ReportRow()
                    ReportRow()
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                
                Spacer()
                ReportRow()
                
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView().environmentObject(NavState())
    }
}

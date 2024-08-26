//
//  TPColleagesView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import SwiftUI

struct TPColleagesView: View {
    @EnvironmentObject var navState: NavState
    
    var colleagesList: [ColleageModel] = [
        ColleageModel(
        userId: "MIO1", name: "MIO Name1", designation: "MIO", market: "MIO Market 1"
        ),
        ColleageModel(
        userId: "MIO2", name: "MIO Name2", designation: "MIO", market: "MIO Market 2"
        )
    ]
    
    
    var body: some View {
        ZStack {
            Color.colorLimeLight
            VStack {
                ScrollView {
                    ForEach(colleagesList){ colleage in
                        TpColleageRowView(colleageModel: colleage,userAction: {
                            navState.path.append(NavRoute.MioTpView)
                        })
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Colleages List for TP")
    }
}

struct TPColleagesView_Previews: PreviewProvider {
    static var previews: some View {
        TPColleagesView().environmentObject(NavState())
    }
}

//
//  SettingsView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 19/8/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var appState: AppState
    
    var mInfos: [InfoItem] = [
        InfoItem(info: "Name: Altaf Hoshain"),
        InfoItem(info: "ID: HBR_BD1"),
        InfoItem(info: "Market: Modhumoti"),
        InfoItem(info: "Group: WE014")
    ]
    
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(mInfos, id: \.id) { data in
                        MyCardView(
                            title: data.info,
                            subtitle: data.info,
                            changePasswordAction: {
                                appState.path.append(AppDestination.changePassword)
                            },
                            supTPAction: {
                                appState.path.append(AppDestination.supTP)
                            },
                            billAction:{
                                appState.path.append(AppDestination.bill)
                            }
                        )
                        
                    }
                }
                .padding()
            }
    
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(AppState())
    }
}

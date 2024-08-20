//
//  SettingsViewBackup.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import SwiftUI

struct SettingsViewBackup: View {
    
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
                                appState.path.append(AppDestination.changePassword(data))
                            },
                            supTPAction: {
                                appState.path.append(AppDestination.supTP(data))
                            },
                            billAction:{
                                appState.path.append(AppDestination.bill(data))
                            }
                        )
                        
                    }
                }
                .padding()
            }
    
        .navigationTitle("Settings")
    }
}

struct SettingsViewBackup_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewBackup().environmentObject(AppState())
    }
}

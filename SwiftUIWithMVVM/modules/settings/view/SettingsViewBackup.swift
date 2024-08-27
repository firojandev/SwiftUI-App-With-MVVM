//
//  SettingsViewBackup.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import SwiftUI

struct SettingsViewBackup: View {
    
    @EnvironmentObject var navState: NavState
    
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
                                navState.path.append(NavRoute.changePassword(data))
                            },
                            supTPAction: {
                                navState.path.append(NavRoute.supTP(data))
                            },
                            billAction:{
                                navState.path.append(NavRoute.bill(data))
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
        SettingsViewBackup().environmentObject(NavState())
    }
}

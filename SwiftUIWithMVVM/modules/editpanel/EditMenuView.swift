//
//  EditMenuView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import SwiftUI

enum EditPanelCode {
    case TP
    case CTP
    case PWDS
    case MWDS
    case DVR
    case WP
    case Bill
    case PI
    case Ev
}

struct EditMenuView: View {
    @EnvironmentObject var navState: NavState
    
    @State private var showingToast: Bool = false
    @State private var toastMessage: String = ""
    
    let gridItems: [EditPanelItem] = [
        EditPanelItem(imageName: "ic_tour_plan", title: "TP",code: EditPanelCode.TP),
        EditPanelItem(imageName: "ic_tour_plan", title: "Change TP",code: EditPanelCode.CTP),
        EditPanelItem(imageName: "ic_pwds", title: "PWDS",code: EditPanelCode.PWDS),
        EditPanelItem(imageName: "ic_gwds", title: "MWDS",code: EditPanelCode.MWDS),
        EditPanelItem(imageName: "doctor", title: "DVR",code: EditPanelCode.DVR),
        EditPanelItem(imageName: "ic_work_plan", title: "Work Plan",code: EditPanelCode.WP),
        EditPanelItem(imageName: "list", title: "Bill",code: EditPanelCode.Bill),
        EditPanelItem(imageName: "agent", title: "Promotional Item",code: EditPanelCode.PI),
        EditPanelItem(imageName: "ic_day_sample_summery", title: "Events",code: EditPanelCode.Ev),
    
    ]
    
    var body: some View {
        ZStack {
            Color.colorLimeLight.ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
                        ForEach(gridItems) { item in
                            EditPanelItemRowView(item: item, userAction:{
                                //menuOption(code: item.code)
                                showingToast = true
                                toastMessage = item.title
                                
                            })
                        }
                    }
                }.toast(isShowing: $showingToast, message: toastMessage)
               
            }
            .padding()
        
            
        }
        .navigationTitle("Edit Panel Menu")
    }
    
    func menuOption(code:EditPanelCode) {
        switch (code) {
        case .TP:
            EmptyView()
        case .CTP:
            EmptyView()
        case .PWDS:
            EmptyView()
        case .MWDS:
            EmptyView()
        case .DVR:
            EmptyView()
        case .WP:
            EmptyView()
        case .Bill:
            EmptyView()
        case .PI:
            EmptyView()
        case .Ev:
            EmptyView()
        }
    }
}

struct EditMenuView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuView().environmentObject(NavState())
    }
}

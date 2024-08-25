//
//  MainMenuView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import SwiftUI

enum MenuCode {
    case TP
    case Bill
    case EP
    case CI
    case R
    case DI
    case TPE
}

struct MainMenuView: View {
    
    @EnvironmentObject var navState: NavState
    
    @State private var showingToast: Bool = false
    @State private var toastMessage: String = ""
    
    let gridItems: [MenuItem] = [
        MenuItem(imageName: "ic_tour_plan", title: "Tour Plan",code: MenuCode.TP),
        MenuItem(imageName: "ic_bill_statement", title: "Bill",code: MenuCode.Bill),
        MenuItem(imageName: "ic_editpanel", title: "Edit Panel",code: MenuCode.EP),
        MenuItem(imageName: "ic_chemist", title: "Colleague Info",code: MenuCode.CI),
        MenuItem(imageName: "ic_sample_statement", title: "Reports",code: MenuCode.R),
        MenuItem(imageName: "doctor", title: "Doctor Info",code: MenuCode.DI),
        MenuItem(imageName: "list", title: "Today's Plan vs Exe",code: MenuCode.TPE),
    ]
    
    
    var body: some View {
        ZStack {
            Color.colorLimeLight.ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        ForEach(gridItems) { item in
                            MenuItemRowView(item: item, userAction:{
                                menuOption(code: item.code)
                                showingToast = true
                                toastMessage = item.title
                                
                            })
                        }
                    }
                }.toast(isShowing: $showingToast, message: toastMessage)
               
            }
            .padding()
        
            
        }
        .navigationTitle("Main Menu")
    }
    
    func menuOption(code:MenuCode) {
        switch (code) {
        case .TP:
            EmptyView()
        case .Bill:
            EmptyView()
        case .EP:
            navState.path.append(NavRoute.EditPanelView)
        case .CI:
            EmptyView()
        case .R:
            EmptyView()
        case .DI:
            EmptyView()
        case .TPE:
            EmptyView()
        }
    }
    
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView().environmentObject(NavState())
    }
}

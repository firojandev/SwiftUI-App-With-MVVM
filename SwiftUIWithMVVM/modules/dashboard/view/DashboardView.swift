//
//  DashboardView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var viewModel = DashboardViewModel()
    
    @EnvironmentObject var navState: NavState
    
    var body: some View {
        VStack {
            ZStack {
                Color.colorLimeLight.ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        ZStack {
                            HStack {
                                Text("Servier Bangladesh")
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10))
                                Spacer()
                                Text("Jun 06, 2024")
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                            .background(Color(hex: "#557288"))
                            
                            Spacer()
                            
                            VStack {
                                Spacer()
                                DashboardCardItem(cntVal: "0", cntTitle: "Total DCR", title: "DCR Summary",offSetVal: 0, userAction:{
                                    
                                }).offset(y:45)
                            }
                            
                        }
                        
                        DashboardMEItem(mDCR:"0", eDCR: "10").offset(y:50)
                        
                        
                        DashboardCardItem(cntVal: "0", cntTitle: "New DCR", title: "New DCR",offSetVal:50, userAction: {
                            print("New DCR")
                            navigate(to: NavRoute.newDoctorView)
                        })
                        
                        DashboardCardItem(cntVal: "0", cntTitle: "Total Chemist Visit", title: "Chemist Visit",offSetVal: 50, userAction: {
                            
                        })
                        
                        
                        Button(action: {
                            print("Todays TP")
                        }){
                            CommonButton(title: "Today's TP").offset(y:50)
                            
                        }
                        
                        Button(action: {
                            print("Admin Panel")
                        }){
                            CommonButton(title: "Web Admin Panel").offset(y:50)
                            
                        }
                        
                    }
                    
                }
            }
        }
        .navigationBarItems(trailing:
                                HStack {
            Button(action: {
                viewModel.willLogout()
            }) {
                Image(systemName: "power")
            }
            
            Button(action: {
                print("Notification")
            }) {
                Image(systemName: "bell")
            }
            
            Button(action: {
                navigate(to: NavRoute.settings)
            }) {
                Image(systemName: "gear")
            }
            
            Button(action: {
                print("menu")
            }) {
                Image(systemName: "line.horizontal.3")
            }
        }
        )
        
        .onChange(of: viewModel.isLogout) { isLogout in
            print("isLogout:\(isLogout)")
            if isLogout {
                navigate(to: NavRoute.loginView)
            }
        }
        .onAppear {
            // Perform any necessary setup on view appear
        }
    }
    
    private func navigate(to route: NavRoute) {
        if #available(iOS 16.0, *) {
            navState.path.append(route)
        } else {
            // Handle navigation for iOS versions before 16
            // This part could involve different navigation logic or using NavigationLink if necessary
            // For simplicity, you might need to update this based on your specific needs
            switch route {
            case .newDoctorView:
                // Navigate to NewDoctorView (e.g., manually update view state or present a sheet)
                break
            case .settings:
                // Navigate to SettingsView (e.g., manually update view state or present a sheet)
                break
            default:
                break
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().environmentObject(NavState())
    }
}

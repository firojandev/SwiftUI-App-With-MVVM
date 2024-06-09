//
//  DashboardView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

struct DashboardView: View {

    @ObservedObject var viewModel = DashboardViewModel()
    

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#DCE1E5").ignoresSafeArea(.all)
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
                                DashboardCardItem(cntVal: "0", cntTitle: "Total DCR", title: "DCR Summary",offSetVal: 0).offset(y:45)
                            }
                            
                        }
                        
                        DashboardMEItem(mDCR:"0", eDCR: "10").offset(y:50)
                        
                        
                        DashboardCardItem(cntVal: "0", cntTitle: "New DCR", title: "New DCR",offSetVal:50)
                        
                        DashboardCardItem(cntVal: "0", cntTitle: "Total Chemist Visit", title: "Chemist Visit",offSetVal: 50)
                        
                       
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
                print("Settings")
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
        .onAppear {
            // Perform any necessary setup on view appear
        }
        .navigationDestination(isPresented: $viewModel.isLogout, destination: { LoginView().navigationBarBackButtonHidden(true)})
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

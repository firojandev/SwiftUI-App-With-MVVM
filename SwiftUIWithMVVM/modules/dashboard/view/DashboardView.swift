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
                Color(.lightGray).ignoresSafeArea(.all)
                ScrollView {
                    VStack {
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
                        
                        DashboardCardItem()
                        DashboardCardItem()
                        DashboardCardItem()
                        DashboardCardItem()
                        
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

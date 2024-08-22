//
//  ContentView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var navState: NavState
    
    @State private var isNavigatingToDashboard = false
    @State private var isNavigatingToLogin = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $navState.path) {
                VStack {
                    if loginViewModel.isLoggedIn {
                        DashboardView().navigationBarBackButtonHidden(true)
                    } else {
                        LoginView().navigationBarBackButtonHidden(true)
                    }
                }
                .navigationDestination(for: NavRoute.self) { destination in
                    switch destination {
                    case .loginView:
                        LoginView().navigationBarBackButtonHidden(true)
                    case .dashboardView:
                        DashboardView().navigationBarBackButtonHidden(true)
                    case .settings:
                        SettingsView()
                    case .changePassword(let info):
                        ChangePasswordView(info: info)
                    case .supTP(let info):
                        SupTPView(info: info)
                    case .bill(let info):
                        BillView(info: info)
                    case .newDoctorView:
                        NewDoctorView()
                    }
                }
            }
            .onAppear {
                loginViewModel.checkLogin()
            }
        } else {
            // For iOS versions before 16
            NavigationView {
                VStack {
                    if loginViewModel.isLoggedIn {
                        DashboardView()
                            .transition(.opacity) // Optional: use transitions for smoother view changes
                            .onAppear {
                                // Handle transitions based on your navigation state
                            }
                    } else {
                        LoginView()
                            .transition(.opacity) // Optional: use transitions for smoother view changes
                            .onAppear {
                                // Handle transitions based on your navigation state
                            }
                    }
                }
                .navigationBarHidden(true) // Optional: hide navigation bar if not needed
            }
            .onAppear {
                loginViewModel.checkLogin()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavState()).environmentObject(LoginViewModel())
    }
}


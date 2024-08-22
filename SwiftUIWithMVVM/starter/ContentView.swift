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
    
    var body: some View {
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
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavState()).environmentObject(LoginViewModel())
    }
}

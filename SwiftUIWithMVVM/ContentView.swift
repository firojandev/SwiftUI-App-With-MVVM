//
//  ContentView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            if  loginViewModel.isLoggedIn {
                DashboardView()
                    .navigationBarBackButtonHidden(true)
            } else {
                LoginView()
            }
        }.onAppear {
            loginViewModel.checkLogin()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

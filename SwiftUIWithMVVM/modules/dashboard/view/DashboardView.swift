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
            ScrollView {
                VStack {
                    Text("V")
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

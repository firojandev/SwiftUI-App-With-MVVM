//
//  LoginView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @State private var rememberMe = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    VStack(spacing: 16) {
                        Text("Login to your account")
                            .font(.largeTitle)
                            .fontWeight(.none)
                        
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("User ID", text: $viewModel.username)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                        
                        HStack {
                            Toggle(isOn: $rememberMe) {
                                Text("Remember Me")
                            }
                            Spacer()
                        }
                        
                        Button(action: {
                            viewModel.login()
                        }) {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        
                        Text("Version 1.0.0")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
            .background(Color(.systemGray5).edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $viewModel.isLoggedIn, destination: { DashboardView().navigationBarBackButtonHidden(true)})
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginViewModel())
    }
}

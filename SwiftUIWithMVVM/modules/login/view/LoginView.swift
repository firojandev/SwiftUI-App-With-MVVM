//
//  LoginView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

//HBR_BD1

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @EnvironmentObject var navState: NavState
    
    @State private var rememberMe = false
    
    @State private var showToast = false
    
    var body: some View {
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
                        if viewModel.isLoading {
                            ProgressView("Please wait...")
                        }
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                        
                        Button(action: {
                            if networkMonitor.isConnected {
                                viewModel.login()
                                showToast = false
                            }else{
                                print("Not connected")
                                showToast = true
                            }
                           
                        }) {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .toast(isShowing:$showToast, message: "Not connected")
                        
                        
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
                    
                    HStack {
                        Link("Privacy Policy", destination: URL(string: "https://your-privacy-url.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Link("Terms & Conditions", destination: URL(string: "https://your-terms-url.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal,20)
                    .padding(.top,8)
                    
                }
            }
            .background(Color(.systemGray5).edgesIgnoringSafeArea(.all))
            .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
                print("isLoggedIn:\(isLoggedIn)")
                if isLoggedIn {
                    navState.path.append(NavRoute.dashboardView)
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(NavState())
            .environmentObject(LoginViewModel())
    }
}

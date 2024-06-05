//
//  SwiftUIWithMVVMApp.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI

@main
struct SwiftUIWithMVVMApp: App {
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(loginViewModel)
        }
    }
}

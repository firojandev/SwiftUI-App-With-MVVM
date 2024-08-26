//
//  SwiftUIWithMVVMApp.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import SwiftUI
import CoreData

@main
struct SwiftUIWithMVVMApp: App {
    @StateObject private var navState = NavState()
    
    @StateObject private var networkMonitor = NetworkMonitor()
    
    let persistentContainer = NSPersistentContainer(name: "Model")
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    init() {
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navState)
                .environmentObject(loginViewModel)
                .environment(\.managedObjectContext, persistentContainer.viewContext)
                .environmentObject(networkMonitor)
        }
    }
}

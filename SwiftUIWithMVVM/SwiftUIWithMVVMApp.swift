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
    @StateObject private var appState = AppState()
    
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
                .environmentObject(appState)
                .environmentObject(loginViewModel)
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}

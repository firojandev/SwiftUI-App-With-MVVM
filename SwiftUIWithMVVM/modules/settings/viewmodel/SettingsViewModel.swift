//
//  SettingsViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    
    @Published var user:User?
    
    private var cancellables = Set<AnyCancellable>()
    
    func getUser() {
        let savedUser = DatabaseService.shared.getUser()
        if savedUser != nil {
            print("Saved User: \(savedUser)")
            self.user = savedUser
            
        }
    }
    
    
}

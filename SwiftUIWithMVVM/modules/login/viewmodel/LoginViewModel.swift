//
//  LoginViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    
    @Published var isLoggedIn = false
    @Published var errorMessage:String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func checkLogin() {
        let user = DatabaseService.shared.getUser()
        if user != nil {
            self.isLoggedIn = true
        }
    }
    
    func login() {
        NetworkService.shared.login(username: username, password: password)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                
            }, receiveValue:{ user in
                DatabaseService.shared.saveUser(user)
                self.isLoggedIn = true
            })
            .store(in: &cancellables)
    }
    
    
}

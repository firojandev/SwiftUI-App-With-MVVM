//
//  DatabaseService.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation

class DatabaseService {
    static let shared = DatabaseService()
    
    func saveUser(_ user:User){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            print("encoded the user")
            print(encoded)
            UserDefaults.standard.set(encoded, forKey: "loggedInUser")
        }
    }
    
    func getUser() -> User? {
        if let savedUser = UserDefaults.standard.object(forKey: "loggedInUser") as? Data {
            print("savedUser 2 \(savedUser)")
            let decoder = JSONDecoder()
            if let fetchedUser = try? decoder.decode(User.self, from:savedUser) {
                print("Fetched User")
                print(fetchedUser)
                return fetchedUser
            }
        }
        return nil
    }
    
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: "loggedInUser")
    }
    
}

//
//  DashboardViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var isLogout = false

   // @Published var empName: String
    

//    init(){
//        let user = DatabaseService.shared.getUser()
//
//        self.empName = user?.empName ?? "Guest"
//
//    }
    
    func willLogout(){
        DatabaseService.shared.clearUserData()
        self.isLogout = true
    }
}

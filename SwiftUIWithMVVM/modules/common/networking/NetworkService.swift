//
//  NetworkService.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()
    
    func login(username:String,password:String) -> AnyPublisher<User,Error>{
        let user  = User(status: "A", message:"Loging successfull", designation: "RM", empName: "Altaf", locName: "Dhaka", locCode: "DK1", depotName: "Dhaka")
        
        //dummy
        return Just(user)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchNotification() -> AnyPublisher<[Notification],Error> {
        //dummy
        let notices = [
            Notification(id: "1", title: "Notice 1", description: "Description 1"),
            Notification(id: "2", title: "Notice 2", description: "Description 2")
        ]
        return Just(notices)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}

//
//  User.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation

struct User: Codable {
    var status:String
    var message:String
    var designation:String
    var empName:String
    var locName:String
    var locCode:String
    var depotName:String
    
    enum CodingKeys:String,CodingKey {
            case status = "Status"
            case message = "Message"
            case designation = "Designation"
            case empName = "EmpName"
            case locCode = "LocCode"
            case locName = "LocName"
            case depotName = "DepotName"
        }
}

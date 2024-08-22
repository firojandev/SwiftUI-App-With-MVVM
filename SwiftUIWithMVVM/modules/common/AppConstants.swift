//
//  AppConstants.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import Foundation

enum APIEnvironment {
    case development
    case production
}

struct AppConstants {
    
    static let environment:APIEnvironment = .development
    
    static let devApiURL = "http://ip/DCRService.svc/Json"
    static let productionApiURL = ""

    static let login = "Login"
    static let logout = "Logout"
    
}

//Mark:- API Endpoint
extension AppConstants {
    static var apiBaseURL: String {
        switch AppConstants.environment {
        case .development:
            return devApiURL
        case .production:
            return productionApiURL
        }
    }
}

//Mark:- API's List
//Get Nature of DA
//http://devApiURL/DCRService.svc/Json/GetMpoTmRsmDAnTA?UserID=HBR_BD1&Designation=RM
//Get Doctors List
//http://devApiURL/DCRService.svc/Json/GetMpoTmRsmDoctorList?UserID=HBR_BD1&Designation=RM&LocCode=WE014

//Mark:- Test Email
extension AppConstants {
    static var testUserId: String {
        switch AppConstants.environment {
        case .development:
            return "RM1"
        case .production:
            return ""
        }
    }
}

//Mark:- Test Password
extension AppConstants {
    static var testPassword: String {
        switch AppConstants.environment {
        case .development:
            return "RM"
        case .production:
            return ""
        }
    }
}

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
    
    static let login = "Login"
    static let logout = "Logout"
    
}

//Mark:- API Endpoint
extension AppConstants {
    static var apiBaseURL: String {
        switch AppConstants.environment {
        case .development:
            return "ip/DCRService.svc/Json"
        case .production:
            return "ip/DCRService.svc/Json"
        }
    }
}

//Mark:- Test Email
extension AppConstants {
    static var testUserId: String {
        switch AppConstants.environment {
        case .development:
            return "HBR_BD1"
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
            return "HBR_BD1"
        case .production:
            return ""
        }
    }
}

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
    
    func login(userId:String,password:String,token:String) -> AnyPublisher<User, Error> {
        
        var urlComponents = URLComponents(string: "\(AppConstants.apiBaseURL)/login")
        urlComponents?.queryItems = [
            URLQueryItem(name: "UserID", value: userId),
            URLQueryItem(name: "Password", value: password),
            URLQueryItem(name: "Token", value: token)
        ]
        
        guard let url = urlComponents?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let responseDataString = String(data: data, encoding: .utf8)
                print("Response Data: \(responseDataString ?? "No Data")")
                
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .tryMap { user in
                var modifiedUser = user
                modifiedUser.userId = userId
                print("modified user \(modifiedUser)")
                return modifiedUser
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getDoctors(userId:String,designation:String,locCode:String) -> AnyPublisher<[DoctorModel], Error> {
        
        var urlComponents = URLComponents(string: "\(AppConstants.apiBaseURL)/GetMpoTmRsmDoctorList")
        urlComponents?.queryItems = [
            URLQueryItem(name: "UserID", value: userId),
            URLQueryItem(name: "Designation", value: designation),
            URLQueryItem(name: "LocCode", value: locCode)
        ]
        
        guard let url = urlComponents?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let responseDataString = String(data: data, encoding: .utf8)
                print("Response Data: \(responseDataString ?? "No Data")")
                
                return data
            }
            .decode(type: DoctorsResponse.self, decoder: JSONDecoder())
            .tryMap { doctorsResponse in
                guard let doctorsList = doctorsResponse.detailList, doctorsResponse.message == "Success" else {
                    throw URLError(.badServerResponse)
                }
                return doctorsList
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}


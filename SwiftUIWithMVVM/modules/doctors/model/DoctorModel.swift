//
//  DoctorModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import Foundation

struct DoctorModel: Codable {
    let id = UUID()
    let address: String
    let adoption: String?
    let degree: String?
    let doctorID: String
    let doctorName: String
    let eveningLocation: String
    let marketCode: String
    let monthNumber: String
    let morningLocation: String?
    let potential: String?
    let specialization: String
    let specializationName: String?
    let teamTarget: String
    let year: String

    enum CodingKeys: String, CodingKey {
        case address = "Address"
        case adoption = "Adoption"
        case degree = "Degree"
        case doctorID = "DoctorID"
        case doctorName = "DoctorName"
        case eveningLocation = "EveningLocation"
        case marketCode = "MarketCode"
        case monthNumber = "MonthNumber"
        case morningLocation = "MorningLocation"
        case potential = "Potential"
        case specialization = "Specialization"
        case specializationName = "SpecializationName"
        case teamTarget = "TeamTarget"
        case year = "Year"
    }
}


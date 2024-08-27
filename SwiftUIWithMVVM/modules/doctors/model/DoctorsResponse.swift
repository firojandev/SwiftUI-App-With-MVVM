//
//  DoctorsResponse.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import Foundation

struct DoctorsResponse: Codable {
    let id = UUID()
    let message: String
    let status: String
    let detailList: [DoctorModel]?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case detailList = "DetailList"
    }
}

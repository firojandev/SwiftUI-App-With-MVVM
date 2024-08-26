//
//  ColleageTP.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import Foundation
struct ColleageTP: Identifiable {
    var id = UUID()
    var date:String
    var mShift:String
    var eShift:String
    var mType:String
    var eType:String
    var mAddress:String
    var eAddress:String
    var mReportTime:String
    var eReportTime:String
    var mPlaces:[String]
    var ePlaces:[String]
    var mLocation:String
    var eLocation:String
    
    init(id: UUID = UUID(), date: String, mShift: String, eShift: String, mType: String, eType: String, mAddress: String, eAddress: String, mReportTime: String, eReportTime: String, mPlaces: [String], ePlaces: [String], mLocation: String, eLocation: String) {
        self.id = id
        self.date = date
        self.mShift = mShift
        self.eShift = eShift
        self.mType = mType
        self.eType = eType
        self.mAddress = mAddress
        self.eAddress = eAddress
        self.mReportTime = mReportTime
        self.eReportTime = eReportTime
        self.mPlaces = mPlaces
        self.ePlaces = ePlaces
        self.mLocation = mLocation
        self.eLocation = eLocation
    }
    
}

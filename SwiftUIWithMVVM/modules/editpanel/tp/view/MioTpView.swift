//
//  MioTpView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import SwiftUI

struct MioTpView: View {
    
    @EnvironmentObject var navState: NavState
    
    var tps: [ColleageTP] = [
        ColleageTP(date: "Sat, 31", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Sat, 30", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Sat, 29", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Sat, 28", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        
    ]
    
    var body: some View {
        ZStack {
            Color.colorLimeLight
            VStack {
                HStack {
                    CommonButtonView(title: "August".uppercased(), backgroundColor: Color.green, action: {})
                    CommonButtonView(title: "September".uppercased(), backgroundColor: Color.orange, action: {})
                }
                .padding(EdgeInsets(.init(top: 16, leading: 16, bottom: 0, trailing:16)))
                
                Spacer()
                ScrollView {
                    //Mark: - Start Loop
                    ForEach(tps) { tp in
                       MioTpRowView(tp: tp)
                    }//: Main Loop
                }
               
            }
        }
        .navigationTitle("TP of MIO Name 1")
        .navigationBarItems(trailing:Button(action: {
            print("Action here")
        }) {
            Text("Approve")
        }
        )
    }
}

struct MioTpView_Previews: PreviewProvider {
    static var previews: some View {
        MioTpView().environmentObject(NavState())
    }
}

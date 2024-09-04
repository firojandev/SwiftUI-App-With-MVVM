//
//  MioTpView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import SwiftUI

struct MioTpView: View {
    
    @EnvironmentObject var navState: NavState
    
    @State private var searchText: String = ""
    
    var tps: [ColleageTP] = [
        ColleageTP(date: "Sat, 31", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Sun, 30", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Mon, 29", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        ColleageTP(date: "Tue, 28", mShift: "Morning", eShift: "Evening", mType: "Working", eType: "Working", mAddress: "Badda", eAddress: "Mohakhali", mReportTime: "08:30", eReportTime: "02:30", mPlaces: ["DMC","RMC"], ePlaces: ["RMC","DMC"], mLocation: "OS", eLocation: "HQ"),
        
    ]
    
    var filteredTps: [ColleageTP] {
        if searchText.isEmpty {
            return tps
        } else {
            return tps.filter {
                $0.date.contains(searchText)
            }
        }
    }
    
    var totalPlacesCount: Int {
        filteredTps.reduce(0) { sum, tp in
            sum + tp.mPlaces.count
        }
    }
        
    
    var body: some View {
        ZStack {
            Color.colorLimeLight
            VStack {
                HStack {
                    CommonButtonView(title: "August".uppercased(), backgroundColor: Color.green, action: {})
                    CommonButtonView(title: "September".uppercased(), backgroundColor: Color.orange, action: {})
                }
                .padding(EdgeInsets(.init(top: 16, leading: 16, bottom: 0, trailing:16)))
                
                HStack {
                    Text("Number of morning places:").foregroundColor(Color.gray)
                    Text("\(totalPlacesCount)").foregroundColor(Color.black)
                    Spacer()
                }
                .padding(.horizontal,10)
                
                Spacer()
                ScrollView {
                    //Mark: - Start Loop
                    ForEach(filteredTps) { tp in
                       MioTpRowView(tp: tp)
                    }//: Main Loop
                }
               
            }
        }
        //.navigationTitle("TPS")
//        .navigationBarItems(trailing:Button(action: {
//            print("Action here")
//        }) {
//            Text("Approve")
//        }
//        )
        .toolbar {
            ToolbarItem(placement: .principal){
                HStack {
//                    TextField("Search", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.leading, 8)
                    TextField("Search", text: $searchText)
                        .padding(8) // Padding inside the TextField
                        .background(Color.white) // Background color
                        .cornerRadius(20) // Rounded corners
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Border color and width
                        )
                        .padding(.leading, 8)
                }
                .frame(maxWidth: .infinity)
                
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    print("Approve action here")
                    navState.path.append(NavRoute.ReportView)
                }) {
                    Text("Approve")
                }
            }
        }
    }
}

struct MioTpView_Previews: PreviewProvider {
    static var previews: some View {
        MioTpView().environmentObject(NavState())
    }
}

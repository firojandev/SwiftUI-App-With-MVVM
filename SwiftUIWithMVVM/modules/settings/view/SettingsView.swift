//
//  SettingsView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 19/8/24.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    
    @Environment(\.managedObjectContext) private var context
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    @EnvironmentObject var navState: NavState
    
    var mInfos: [InfoItem] = [
        InfoItem(info: "Name: Altaf Hoshain"),
        InfoItem(info: "ID: HBR_BD1"),
        InfoItem(info: "Market: Modhumoti"),
        InfoItem(info: "Group: WE014")
    ]
    
    struct InfoTextView: View {
        let text: String
        var body: some View {
            Text(text)
                .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack (alignment: .leading) {
                    Text("Logged User Info")
                        .frame(maxWidth: .infinity,minHeight: 50,alignment: .center)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.green)
                    
                    InfoTextView(text: "Name: \(viewModel.user?.empName ?? "")")
                    InfoTextView(text: "ID: \(viewModel.user?.userId ?? "")")
                    InfoTextView(text: "Market: \(viewModel.user?.locName ?? "")")
                    InfoTextView(text: "Group: \(viewModel.user?.mpGroup ?? "")")
                    InfoTextView(text: "Depot: \(viewModel.user?.depotName ?? "")")
                    
                    
                    Button("Change Password"){
                        navState.path.append(NavRoute.changePassword(InfoItem(info: "")))
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .shadow(radius: 5)
                
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                
                if viewModel.errorMessage != nil {
                    Text(viewModel.errorMessage ?? "").foregroundColor(.red)
                }
                
                Button(action: {
                    viewModel.getDoctors(
                        userId: viewModel.user?.userId ?? "",
                        designation: viewModel.user?.designation ?? "",
                        locCode: viewModel.user?.locCode ?? "",
                        context: context)
                }) {
                    Text("Sync Basic Data")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding(EdgeInsets(top: 10, leading: 1, bottom: 10, trailing: 1))
                
                Spacer()
                
                VStack {
                    Text("Clear App Data")
                        .frame(maxWidth: .infinity,minHeight: 50)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.red)
                    
                    Text("Clear EDCR app data saved in mobile")
                        .font(.footnote)
                    
                    Button(action: {}) {
                        Text("Clear Now")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .foregroundColor(.black)
                            .cornerRadius(5)
                    }.padding()
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .shadow(radius: 5)
                
                Text("EDCR Super Servier V1.0.3.20082024 @ Square InformatiX Ltd 2024")
                    .font(.footnote)
                    .padding()
                
                Spacer()
                
                
            }
            .padding()
        }
        .navigationTitle("Settings")
        .onAppear{
            viewModel.getUser()
            
            //fetch doctors list for testing purpose
            let doctors =  viewModel.getSavedDoctors(context: context)
            print("total doctors:\(doctors.count)")
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(NavState())
    }
}

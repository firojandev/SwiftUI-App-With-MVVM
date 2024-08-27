//
//  NewDoctorView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import SwiftUI

struct NewDoctorView: View {
    
    @EnvironmentObject var navState: NavState
    
    @ObservedObject var viewModel = NewDoctorViewModel()
    
    var body: some View {
        //Mark: - Main Body
        ZStack {
            
            Color.colorLimeLight.ignoresSafeArea(.all)
            
            //Mark: - Main Container
            VStack {
                
                //Mark: - Scroll
                ScrollView {
                    
                    VStack {
                        
                        TextField("Doctor Name", text: $viewModel.doctorName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .keyboardType(.alphabet)
                            .autocapitalization(.none)
                        
                        HStack {
                            CommonRadioButtonView(title: "Morning", isSelected:
                                                    Binding(
                                                        get: { viewModel.selectedShift == "Morning" },
                                                        set: { if $0 { viewModel.selectedShift = "Morning" } }
                                                    )) {
                                                        viewModel.selectedShift = "Morning"
                                                    }
                            CommonRadioButtonView(title: "Evening", isSelected:  Binding(
                                get: { viewModel.selectedShift == "Evening" },
                                set: { if $0 { viewModel.selectedShift = "Evening" } }
                            )) {
                                viewModel.selectedShift = "Evening"
                            }
                            
                        }
                        .padding()
                        
                        
                        Spacer()
                        
                        //Mark: - Action button container
                        HStack {
                            
                            CommonButtonView(title: "Cancel", backgroundColor: Color.red, action:{
                                print("cancel")
                            })
                            CommonButtonView(title: "Submit", backgroundColor: Color.blue, action:{
                                print("Submit \(viewModel.selectedShift)")
                                
                                viewModel.submit()
                            })
                            
                        }//: - Action button container
                        .padding(.vertical,10)
                        
                        
                    }//: - VStack
                    .padding()
                    
                }//: - ScrollView
                
            }//: - Main Container
            
        }//: - ZStack
        .navigationTitle("New Doctor")
    }
}

struct NewDoctorView_Previews: PreviewProvider {
    static var previews: some View {
        NewDoctorView().environmentObject(NavState())
    }
}

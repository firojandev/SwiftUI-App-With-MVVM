//
//  NewDoctorViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import Foundation

class NewDoctorViewModel: ObservableObject {
    @Published var doctorName:String = ""
    @Published var selectedShift:String = ""
    
    func submit(){
        //process here
        
        //Reset
        resetSelection()
    }
    
    func resetSelection() {
        selectedShift = ""
    }
}

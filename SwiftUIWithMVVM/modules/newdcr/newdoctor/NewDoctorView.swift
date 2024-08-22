//
//  NewDoctorView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import SwiftUI

struct NewDoctorView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewDoctorView_Previews: PreviewProvider {
    static var previews: some View {
        NewDoctorView().environmentObject(AppState())
    }
}

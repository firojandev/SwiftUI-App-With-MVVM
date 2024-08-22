//
//  SettingsViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 20/8/24.
//

import Foundation
import Combine
import CoreData

class SettingsViewModel: ObservableObject {
    
    @Published var user:User?
    
    @Published var doctorsList: [DoctorModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    //Saved local doctors
    //@Published var savedDoctorsList: [Doctors] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func getUser() {
        let savedUser = DatabaseService.shared.getUser()
        if savedUser != nil {
            self.user = savedUser
            
        }
    }
    
    func getDoctors(userId:String,designation:String,locCode:String,context:NSManagedObjectContext) {
        self.isLoading = true
        NetworkService.shared.getDoctors(userId: userId, designation: designation, locCode: locCode)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }, receiveValue: { items in
                self.doctorsList = items
                
                //Saving to local
                DatabaseService.shared.saveDoctorsToCoreData(
                    doctorsList: self.doctorsList,
                    context: context
                )
                
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    func getSavedDoctors(context:NSManagedObjectContext)  -> [Doctors] {
        let doctors =  DatabaseService.shared.fetchDoctorsFromCoreData(context: context)
        
        return doctors
    }
    
    
}

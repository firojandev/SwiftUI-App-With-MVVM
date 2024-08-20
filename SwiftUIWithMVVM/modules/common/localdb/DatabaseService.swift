//
//  DatabaseService.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation
import CoreData

class DatabaseService {
    static let shared = DatabaseService()
    
    func saveUser(_ user:User){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            print("encoded the user")
            print(encoded)
            UserDefaults.standard.set(encoded, forKey: "loggedInUser")
        }
    }
    
    func getUser() -> User? {
        if let savedUser = UserDefaults.standard.object(forKey: "loggedInUser") as? Data {
            print("savedUser 2 \(savedUser)")
            let decoder = JSONDecoder()
            if let fetchedUser = try? decoder.decode(User.self, from:savedUser) {
                print("Fetched User")
                print(fetchedUser)
                return fetchedUser
            }
        }
        return nil
    }
    
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: "loggedInUser")
    }
    
    func saveDoctorsToCoreData(doctorsList: [DoctorModel], context: NSManagedObjectContext) {
        context.perform {
            // Clear existing data if necessary
            let fetchRequest: NSFetchRequest<Doctors> = Doctors.fetchRequest()
            let existingDoctors = try? context.fetch(fetchRequest)
            existingDoctors?.forEach { context.delete($0) }

            // Save new doctors
            for doctorModel in doctorsList {
                let doctor = Doctors(context: context)
                doctor.doctorId = doctorModel.doctorID
                doctor.doctorName = doctorModel.doctorName
               
                doctor.address = doctorModel.address
                doctor.adoption = doctorModel.adoption
                doctor.degree = doctorModel.degree
                doctor.eveningLocation = doctorModel.eveningLocation
                doctor.marketCode = doctorModel.marketCode
                doctor.monthNumber = doctorModel.monthNumber
                doctor.morningLocation = doctorModel.morningLocation
                doctor.potential = doctorModel.potential
                doctor.specializationName = doctorModel.specialization
                doctor.teamTarget = doctorModel.teamTarget
                doctor.year = doctorModel.year
            }
            // Save context
            do {
                try context.save()
            } catch {
                print("Failed to save doctors: \(error)")
            }
        }
    }
    
    func fetchDoctorsFromCoreData(context: NSManagedObjectContext) -> [Doctors] {
        let fetchRequest: NSFetchRequest<Doctors> = Doctors.fetchRequest()
        do {
            let doctors = try context.fetch(fetchRequest)
            return doctors
        } catch {
            print("Failed to fetch doctors: \(error)")
            return []
        }
    }
    
}

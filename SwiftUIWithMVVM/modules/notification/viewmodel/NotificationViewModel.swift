//
//  NotificationViewModel.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 5/6/24.
//

import Foundation
import Combine

class NoticeListViewModel: ObservableObject {
    @Published var notification = [Notification]()
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchNotices() {
       
    }
}

//
//  EditPanelItem.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import Foundation
struct EditPanelItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let code: EditPanelCode
}

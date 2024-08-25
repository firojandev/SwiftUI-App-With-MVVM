//
//  MenuItem.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import Foundation
struct MenuItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let code: MenuCode
}

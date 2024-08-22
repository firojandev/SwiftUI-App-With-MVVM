//
//  AppDestination.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 19/8/24.
//

import Foundation
import SwiftUI

enum AppDestination:Hashable {
    case settings
    case changePassword(InfoItem)
    case supTP(InfoItem)
    case bill(InfoItem)
    case newDoctor
}

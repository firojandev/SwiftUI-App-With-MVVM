//
//  NavRoute.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import Foundation
import SwiftUI

enum NavRoute:Hashable {
    case loginView
    case dashboardView
    case settings
    case changePassword(InfoItem)
    case MainMenu
    case supTP(InfoItem)
    case bill(InfoItem)
    case newDoctorView
    case EditPanelView
    case TpColleagueView
    case MioTpView
    case ReportView
}

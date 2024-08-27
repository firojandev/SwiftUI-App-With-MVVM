//
//  NavState.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 22/8/24.
//

import Foundation
import SwiftUI

class NavState: ObservableObject {
    @Published var path = NavigationPath()
}

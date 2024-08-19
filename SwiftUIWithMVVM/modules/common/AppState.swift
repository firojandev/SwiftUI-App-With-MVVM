//
//  AppState.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 19/8/24.
//

import Foundation

import SwiftUI

class AppState: ObservableObject {
    @Published var path = NavigationPath()
}

//
//  ViewExtensions.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import Foundation
import SwiftUI

extension View {
    func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing, message: message))
    }
}

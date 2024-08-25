//
//  ToastModifier.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            ToastView(message: message, isShowing: isShowing, onDismiss: {
                withAnimation {
                    isShowing = false
                }
            })
        }
    }
}

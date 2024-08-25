//
//  ToastView.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 25/8/24.
//

import SwiftUI

struct ToastView: View {
    let message: String
    let isShowing: Bool
    let onDismiss: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                HStack {
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                onDismiss()
                            }
                        }
                }
                .transition(.opacity)
                .animation(.easeOut)
            }
            Spacer()
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "Test", isShowing: true, onDismiss: {
            
        })
    }
}

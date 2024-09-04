//
//  TextExtensions.swift
//  SwiftUIWithMVVM
//
//  Created by Md Altaf Hoshain Firoj on 26/8/24.
//

import Foundation
import SwiftUI

extension Text {
    func customeTextStyle() -> some View {
        self
            .foregroundColor(Color.black)
            .font(.caption)
            .padding()
    }
    
    func customStyle() -> some View {
        self
            .font(.caption)
    }
    
    
    func textLabel() -> some View {
        self
            .font(.caption)
            .foregroundColor(Color.gray)
    }
    
    func textValue() -> some View {
        self
            .font(.footnote)
            .foregroundColor(Color.black)
    }
    
}

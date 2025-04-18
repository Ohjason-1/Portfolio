//
//  PrimaryTextFieldModifier.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/17/25.
//

import SwiftUI

struct PrimaryButtondModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 350, height: 44)
            .background(Color(.systemPink))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

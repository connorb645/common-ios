//
//  BackgroundView.swift
//  Common
//
//  Created by Connor Black on 28/03/2025.
//

import SwiftUI


public struct BackgroundView<Content: View>: View {
    let color: Color
    let content: () -> Content

    public init(color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.content = content
    }

    public var body: some View {
        ZStack {
            color
                .ignoresSafeArea()

            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

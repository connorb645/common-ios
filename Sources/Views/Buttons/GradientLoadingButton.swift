//
//  GradientLoadingButton.swift
//  Common
//
//  Created by Connor Black on 21/06/2025.
//


import SwiftUI

public struct GradientLoadingButton: View {

    public static func primary(
        title: String,
        isLoading: Bool,
        tintColor: Color = .white,
        leadingGradientColor: Color = Color.indigo.mix(with: .white, by: 0.2),
        trailingGradientColor: Color = Color.indigo.mix(with: .white, by: 0.1),
        action: @escaping () -> Void
    ) -> Self {
        .init(
            title: title,
            tintColor: tintColor, // DONT REMOVE - settings.theme.font.primaryInverted
            leadingGradientColor: leadingGradientColor,
            trailingGradientColor: trailingGradientColor,
            isLoading: isLoading,
            action: action
        )
    }

    private let title: String
    private let tintColor: Color
    private let leadingGradientColor: Color
    private let trailingGradientColor: Color
    private let isLoading: Bool
    private let action: () -> Void

    public init(
        title: String,
        tintColor: Color,
        leadingGradientColor: Color,
        trailingGradientColor: Color,
        isLoading: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.tintColor = tintColor
        self.leadingGradientColor = leadingGradientColor
        self.trailingGradientColor = trailingGradientColor
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                Text(isLoading ? "" : title)
                    .poppins(18)
                    .fontWeight(.bold)
                    .foregroundStyle(tintColor)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 45)
            .background(buttonBackground)
            .cornerRadius(15)
            .disabled(isLoading)

            ProgressView()
                .opacity(isLoading ? 1.0 : 0.0)
                .animation(.easeInOut, value: isLoading)
                .tint(tintColor)
        }
    }

    @ViewBuilder
    var buttonBackground: some View {
        if isLoading {
            animatedBackground
        } else {
            stillBackground
        }
    }

    @ViewBuilder
    var stillBackground: some View {
        MeshGradient(
            width: 4,
            height: 3,
            points: [
                [0.0, 0.0], [0.10, 0.0], [0.90, 0.0], [1.0, 0.0],
                [0.0, 0.5], [0.10, 0.5], [0.90, 0.5], [1.0, 0.5],
                [0.0, 1.0], [0.10, 1.0], [0.90, 1.0], [1.0, 1.0]
            ],
            colors: [
                leadingGradientColor, leadingGradientColor, trailingGradientColor, trailingGradientColor,
                leadingGradientColor, leadingGradientColor, trailingGradientColor, trailingGradientColor,
                leadingGradientColor, leadingGradientColor, trailingGradientColor, trailingGradientColor
            ]
        )
    }

    @ViewBuilder
    var animatedBackground: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSince1970

            let x = (sin(t * 2.4) + sin(t * 1.4 + 1.5) + sin(t * 0.6 + 3.2)) / 3
            let y = (cos(t * 2.2) + cos(t * 1.0 + 2.1) + cos(t * 0.5 + 0.8)) / 3

            let normalizedX = (x + 1) / 2
            let normalizedY = (y + 1) / 2

            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [Float(normalizedX), Float(normalizedY)], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                colors: [
                    leadingGradientColor, leadingGradientColor, trailingGradientColor,
                    leadingGradientColor, leadingGradientColor, trailingGradientColor,
                    trailingGradientColor, trailingGradientColor, trailingGradientColor
                ]
            )
        }
    }
}

#Preview {
    GradientLoadingButton(
        title: "Example title",
        tintColor: .black,
        leadingGradientColor: .indigo,
        trailingGradientColor: .indigo.opacity(0.5),
        isLoading: false,
        action: {}
    )
}

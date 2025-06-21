//
//  PrimaryTextFieldStyle.swift
//  Common
//
//  Created by Connor Black on 21/06/2025.
//


import SwiftUI

public struct PrimaryTextFieldStyle<
    Foreground: ShapeStyle,
    Background: ShapeStyle
>: ViewModifier {
    let foregroundStyle: Foreground
    let backgroundStyle: Background
    let height: CGFloat
    let cornerRadius: CGFloat

    public init(
        foregroundStyle: Foreground = Color.black,
        backgroundStyle: Background = Color.white,
        height: CGFloat = 45,
        cornerRadius: CGFloat = 10
    ) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundStyle = backgroundStyle
        self.foregroundStyle = foregroundStyle
    }

    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(foregroundStyle)
        //      .foregroundStyle(settings.theme.font.primary)
            .frame(height: height)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundStyle)
//                    .fill(settings.theme.background.secondary)
            )
    }
}

public extension View {
    func primaryTextFieldStyle<
        Foreground: ShapeStyle,
        Background: ShapeStyle
    >(
        foregroundStyle: Foreground = Color.black,
        backgroundStyle: Background = Color.white,
        height: CGFloat = 45,
        cornerRadius: CGFloat = 10
    ) -> some View {
        modifier(
            PrimaryTextFieldStyle(
                foregroundStyle: foregroundStyle,
                backgroundStyle: backgroundStyle,
                height: height,
                cornerRadius: cornerRadius
            )
        )
    }
}

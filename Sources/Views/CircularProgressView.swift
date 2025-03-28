//
//  CircularProgressView.swift
//  Common
//
//  Created by Connor Black on 28/03/2025.
//

import SwiftUI

public struct CircularProgressView: View {
    private let progress: Double
    private let lineWidth: Double
    private let color: Color

    public init(
        progress: Double,
        lineWidth: Double,
        color: Color
    ) {
        self.progress = progress
        self.lineWidth = lineWidth
        self.color = color
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.1)
                .foregroundColor(color)

            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
        .padding(lineWidth * 0.5)
    }
}

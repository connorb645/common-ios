//
//  CircleProgressButton.swift
//  Common
//
//  Created by Connor Black on 28/03/2025.
//

import SwiftUI

public struct CircleProgressButton: View {
    private let action: () -> Void
    private let iconName: String
    private let progress: Double
    private let foregroundColor: Color

    public init(
        iconName: String,
        progress: Double,
        foregroundColor: Color,
        action: @escaping () -> Void
    ) {
        self.action = action
        self.iconName = iconName
        self.progress = progress
        self.foregroundColor = foregroundColor
    }

    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                CircularProgressView(progress: progress, lineWidth: 7, color: foregroundColor)
                    .frame(width: 85, height: 85)
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60, height: 60)
                Image(systemName: iconName)
                    .foregroundStyle(foregroundColor)
            }
        }
    }
}

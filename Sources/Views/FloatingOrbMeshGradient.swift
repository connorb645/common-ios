//
//  FloatingOrbMeshGradient.swift
//  Common
//
//  Created by Connor Black on 21/06/2025.
//

import SwiftUI

public struct FloatingOrbMeshGradient: View {
    private let backgroundColor: Color
    private let orbColor: Color

    public init(
        backgroundColor: Color,
        orbColor: Color
    ) {
        self.backgroundColor = backgroundColor
        self.orbColor = orbColor
    }

    public var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSince1970

            let x = (sin(t * 1.2) + sin(t * 0.7 + 1.5) + sin(t * 0.3 + 3.2)) / 3
            let y = (cos(t * 1.1) + cos(t * 0.5 + 2.1) + cos(t * 0.25 + 0.8)) / 3

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
                    backgroundColor, backgroundColor, backgroundColor,
                    backgroundColor, orbColor, backgroundColor,
                    backgroundColor, backgroundColor, backgroundColor
                ]
            )
        }
    }
}

#Preview {
    FloatingOrbMeshGradient(
        backgroundColor: .blue,
        orbColor: .white
    )
}

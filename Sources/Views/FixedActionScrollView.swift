//
//  FixedActionScrollView.swift
//  Common
//
//  Created by Connor Black on 21/06/2025.
//

import SwiftUI

public struct FixedActionScrollView<ScrollableContent: View, FixedContent: View>: View {
    let fixedContentBackgroundColor: Color
    let scrollableContent: () -> ScrollableContent
    let fixedContent: () -> FixedContent

    public init(
        fixedContentBackgroundColor: Color,
        @ViewBuilder scrollableContent: @escaping () -> ScrollableContent,
        @ViewBuilder fixedContent: @escaping () -> FixedContent
    ) {
        self.fixedContentBackgroundColor = fixedContentBackgroundColor
        self.scrollableContent = scrollableContent
        self.fixedContent = fixedContent
    }

    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView {
                    scrollableContent()
                    Spacer()
                        .frame(height: 300)
                }
                .scrollDismissesKeyboard(.interactively)
                .scrollIndicators(.hidden)
            }

            VStack(spacing: 0) {
                Color.clear
                fixedContent()
                    .padding()
                    .background(fixedContentBackgroundColor)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

//
//  PlayerView.swift
//  Common
//
//  Created by Connor Black on 31/03/2025.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit

public struct PlayerView: UIViewRepresentable {
    private let fileUrl: URL

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    public func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero, fileUrl: fileUrl)
    }

    public init(fileUrl: URL) {
        self.fileUrl = fileUrl
    }
}

final public class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(frame: CGRect, fileUrl: URL) {
        super.init(frame: frame)
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

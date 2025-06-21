//
//  File.swift
//  Common
//
//  Created by Connor Black on 21/06/2025.
//

import Sharing
import Foundation

public struct Environment {
    public let baseURL: String

    public init(baseURL: String) {
        self.baseURL = baseURL
    }
}

public actor BuildConfiguration {
    public var environment: Environment
    public var revenueCatKey: String
    public static let initial = BuildConfiguration()

    public init() {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
        environment = Environment(baseURL: baseURL)
        let revenueCatId = Bundle.main.object(forInfoDictionaryKey: "RevenueCatKey") as! String
        self.revenueCatKey = revenueCatId
    }
}

public extension SharedReaderKey where Self == InMemoryKey<BuildConfiguration> {
    static var buildConfiguration: Self {
        inMemory("build-configuration")
    }
}

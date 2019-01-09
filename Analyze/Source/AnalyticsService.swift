//
//  AnalyticsService.swift
//  Analyze
//
//  Created by Kyle Begeman on 2/2/18.
//  Copyright © 2018 Kyle Begeman. All rights reserved.
//

import UIKit

public protocol AnalyticsService {
    /// Required for identification and restriction
    var provider: AnalyticsProvider { get }

    /// Default initializer for setting up the service
    ///
    /// - Parameters:
    ///   - application: UIApplication instance
    ///   - launchOptions: launch options passed into the app delegate
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    /// Construct the proper event name with the given event and delimiter.
    ///
    /// - Parameter event: the event object to be named.
    /// - Returns: string value of the final name.
    func name(for event: AnalyticsEvent) -> String

    /// Determine if the given service is supposed to track this group of events.
    ///
    /// - Parameter group: the group to check for
    /// - Returns: bool representing if the group is allowed
    func shouldTrack(event: AnalyticsEvent) -> Bool

    /// Log the provided event using the underlying engine.
    ///
    /// - Parameter event: the event to be logged.
    func log(_ event: AnalyticsEvent)
}

/// Extend AnalyticsService for default 'eventName' method implementation.
extension AnalyticsService {
    public func name(for event: AnalyticsEvent) -> String {
        return event.category + self.provider.delimiter + event.name
    }

    public func shouldTrack(event: AnalyticsEvent) -> Bool {
        return event.providers.contains(where: {
            $0.name == self.provider.name &&
            $0.delimiter == self.provider.delimiter
        })
    }
}

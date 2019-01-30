//
//  AnalyticsServicable.swift
//  //  Analyze
//
//  Created by Kyle Begeman on 5/9/18.
//  Copyright © 2018 Kyle Begeman. All rights reserved.
//

import Foundation

public protocol AnalyticsServicable {
    /// Default initializer for setting up the service
    ///
    /// - Parameters:
    ///   - application: UIApplication instance
    ///   - launchOptions: launch options passed into the app delegate
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    /// Log the provided event using the underlying framework.
    ///
    /// - Parameter event: the event to be logged.
    func log(_ event: AnalyticsEvent)
}

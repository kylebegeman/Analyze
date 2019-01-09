//
//  AnalyticsEvent.swift
//  Analyze
//
//  Created by Kyle Begeman on 2/2/18.
//  Copyright © 2018 Kyle Begeman. All rights reserved.
//

import UIKit

/// Defines the required properties of each "event" item.
public protocol AnalyticsEvent {
    /// The category, or identifier, associated with the event.
    ///
    /// Ex: category = "User" : name = "login" : event = "User" + delimiter + "login".
    var category: String { get }

    /// The name to be logged.
    var name: String { get }

    /// The metadata for this event, if any.
    var metadata: Metadata { get }

    /// The analytics provider
    var providers: [AnalyticsProvider] { get }
}

/// Typealias for basic metadata type.
public typealias Metadata = [String: Any]

/// An enum representation of each analytics provider, ex: Google, Firebase, Flurry, etc...
///
///     enum Provider: Int, AnalyticsProvider {
///         case Firebase
///         case Mixpanel
///
///         static var all: [AnalyticsProvider] {
///             var index = 0
///             var providers = [Provider]()
///             while let provider = Provider(rawValue: index) {
///                 providers.append(provider)
///                 index += 1
///             }
///
///             return providers
///         }
///     }
public protocol AnalyticsProvider {
    /// The name of the provider for identification purposes
    var name: String { get }

    /// Used for event naming; a provider acceptable string delimiter. Ex: +, -, _ or *
    var delimiter: String { get }

    /// A required method on an Int based enum to return all
    static var all: [AnalyticsProvider] { get }
}

/// Default name implementation
public extension AnalyticsProvider {
    var name: String {
        return String(describing: self)
    }

    var delimiter: String {
        return ""
    }
}

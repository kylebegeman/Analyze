//
//  AnalyticsEvent.swift
//  Analyze
//
//  Created by Kyle Begeman on 2/2/18.
//  Copyright © 2018 Kyle Begeman. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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

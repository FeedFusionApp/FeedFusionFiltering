//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public class FeedFilter: Filter, ObservableObject {
    public let id: UUID = UUID()
    public var description: String { "FeedFilter(type: \(type), feedID: \(feedID?.uuidString ?? "_")"}
    public var filterType: FilterType { .feed }
    
    public var type: FeedFilterType
    public var feedID: UUID?
    
    public init(type: FeedFilterType, feedID: UUID?) {
        self.type = type
        self.feedID = feedID
    }
}

public extension Filters {
    static func feed(_ type: FeedFilterType, feedID: UUID?) -> Self {
        return .feed(.init(type: type, feedID: feedID))
    }
}

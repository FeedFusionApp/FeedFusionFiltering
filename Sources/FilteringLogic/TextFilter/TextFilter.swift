//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public class TextFilter: Filter, ObservableObject {
    public let id: UUID = UUID()
    public var description: String { "FeedFilter(type: \(type), key: \(key), term: '\(term)'"}
    public var filterType: FilterType { .text }
    
    public var key: TextFilterKey
    public var term: String
    public var type: TextFilterType
    
    init(key: TextFilterKey, type: TextFilterType, term: String) {
        self.key = key
        self.type = type
        self.term = term
    }
}

public extension Filters {
    static func text(_ key: TextFilterKey, type: TextFilterType, term: String) -> Self {
        return .text(.init(key: key, type: type, term: term))
    }
}

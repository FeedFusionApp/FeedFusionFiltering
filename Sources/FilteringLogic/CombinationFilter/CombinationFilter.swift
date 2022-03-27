//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public class CombinationFilter: Filter, ObservableObject {
    public var id: UUID { UUID() }
    public var description: String { "CombinationFilter(type: \(type), children: [\(children.map(\.description).joined(separator: ", "))])"}
    public var filterType: FilterType { .combination }
    
    public var type: CombinationFilterType
    public var children: [FilterContainer]
    
    public init(type: CombinationFilterType, children: [FilterContainer]) {
        self.type = type
        self.children = children
    }
}

public extension Filters {
    static func combination(_ type: CombinationFilterType, children: [Filters]) -> Self {
        return .combination(.init(type: type, children: children.map(FilterContainer.init)))
    }
}

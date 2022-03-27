//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public enum Filters: Filter {
    public var description: String {
        switch self {
            case .combination(let filter):
                return filter.description
            case .feed(let filter):
                return filter.description
            case .text(let filter):
                return filter.description
        }
    }
    
    public var filterType: FilterType {
        switch self {
            case .combination(let filter):
                return filter.filterType
                
            case .feed(let filter):
                return filter.filterType
                
            case .text(let filter):
                return filter.filterType
        }
    }
    
    public var id: UUID {
        switch self {
            case .combination(let filter):
                return filter.id
                
            case .feed(let filter):
                return filter.id
                
            case .text(let filter):
                return filter.id
        }
    }
    
    case combination(CombinationFilter)
    case feed(FeedFilter)
    case text(TextFilter)
}

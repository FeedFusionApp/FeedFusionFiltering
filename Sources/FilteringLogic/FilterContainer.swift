//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public class FilterContainer: ObservableObject, Filter {
    public var id: UUID { filter.id }
    
    public var filterType: FilterType { filter.filterType }
    
    public var description: String { filter.description }
    
    @Published public var filter: Filters
    
    public init(_ filter: Filters) {
        self.filter = filter
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(filter, forKey: .filter)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filter = try container.decode(Filters.self, forKey: .filter)
    }
    
    enum CodingKeys: String, CodingKey {
        case filter
    }
}

//
//  FilteringView.swift
//  
//
//  Created by Noah Kamara on 17.03.22.
//

import SwiftUI
import FilteringLogic

public struct FilteringView<Feed: FilteringFeed>: View {
    let config: FilteringViewConfig<Feed>
    @ObservedObject var filter: FilterContainer
    var nesting: Int = 0
    
    public init(config: FilteringViewConfig<Feed>, filter: FilterContainer, nesting: Int = 0) {
        self.config = config
        self.filter = filter
        self.nesting = nesting
    }
    
    public var body: some View {
        switch filter.filter {
            case .combination(let filter):
                CombinationFilterView(config: config, filter: filter)
            case .feed(let filter):
                FeedFilterView(config: config, filter: filter)
            case .text(let filter):
                TextFilterView(config: config, filter: filter)
        }
    }
}

struct FilteringView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringView(config: .default, filter: .init(.combination(.and, children: [])))
    }
}

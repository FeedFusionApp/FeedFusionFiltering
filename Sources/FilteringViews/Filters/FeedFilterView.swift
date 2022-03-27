//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic
import Combine

public protocol FilteringFeed {
    var filteringFeedID: UUID { get }
    var filteringLabel: String { get }
    var filteringIcon: Image? { get }
}

extension FilteringView {
    struct FeedFilterView: View {
        @State private var cancellables: Set<AnyCancellable> = .init()
        
        let config: FilteringViewConfig<Feed>
        @ObservedObject var filter: FeedFilter
        var nesting: Int = 0
        
        @State var feeds: [FilteringFeed] = []
        @State var feed: FilteringFeed? {
            didSet {
                self.filter.feedID = feed?.filteringFeedID
            }
        }
        @State var type: FeedFilterType = .is {
            didSet {
                filter.type = type
            }
        }
        
        var body: some View {
            Element(config: config, filterType: .feed) {
                Spacer()
                
                FilteringMenu(config: config) {
                    Text(type.localized)
                } content: {
                    ForEach(FeedFilterType.allCases, id: \.self) { option in
                        Button(action: { type = option }) {
                            HStack {
                                if filter.type == option {
                                    Image(systemName: "checkmark")
                                }
                                Text(option.localized)
                            }
                        }
                    }
                }
                
            } collapse: {
                FilteringMenu(config: config) {
                    Group {
                        if let feed = feed {
                            feedElement(feed)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Label("Choose Feed", systemImage: "plus")
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                    }
                } content: {
                    ForEach(feeds, id:\.filteringFeedID) { feed in
                        Button(action: { self.feed = feed }) {
                            feedElement(feed)
                        }
                    }
                }
            }
            .onAppear(perform: loadFeeds)
        }
        
        
        func loadFeeds() {
            config
                .feedStorage
                .sink { feeds in
                    self.feeds = feeds
                    
                    if let feedID = filter.feedID {
                        self.feed = self.feeds.first(where: { $0.filteringFeedID == feedID })
                    }
                }
                .store(in: &cancellables)
        }
        
        func feedElement(_ feed: FilteringFeed) -> some View {
            HStack {
                Group {
                    if let feedIcon = feed.filteringIcon {
                        feedIcon
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                    } else {
                        Image(systemName: "square")
                    }
                }
                .padding(2)
                .frame(width: 25, height: 25)
                Text(feed.filteringLabel)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.tint(.primary)
        }
    }
}

struct FeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringView.FeedFilterView(config: .default, filter: .init(type: .isNot, feedID: nil))
    }
}

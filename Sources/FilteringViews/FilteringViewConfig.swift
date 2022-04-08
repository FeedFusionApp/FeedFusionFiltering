//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import Combine

public struct TestFeed: FilteringFeed {
    public var filteringFeedID: UUID = .init()
    
    public var filteringLabel: String = "Text"
    
    public var filteringIcon: Image? = nil
}

public struct FilteringViewConfig<Feed: FilteringFeed> {
    public static var `default`: FilteringViewConfig<TestFeed>  {
        .init(
            primaryBackground: .white,
            secondaryBackground: .init(red: 0.929,
                                       green: 0.922,
                                       blue: 0.918),
            primaryText: .black,
            secondaryText: .init(red: 0.557,
                                 green: 0.553,
                                 blue: 0.549),
            feedStorage: .init(.init([]))
        )
    }
    var primaryBackground: Color
    var secondaryBackground: Color
    var primaryText: Color
    var secondaryText: Color
    
    
    var feedStorage: CurrentValueSubject<[Feed], Never>
    
    public init(primaryBackground: Color, secondaryBackground: Color, primaryText: Color, secondaryText: Color, feedStorage: CurrentValueSubject<[Feed], Never>) {
        self.primaryBackground = primaryBackground
        self.secondaryBackground = secondaryBackground
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self.feedStorage = feedStorage
    }
}

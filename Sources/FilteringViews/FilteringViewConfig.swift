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
    public static var `default`: FilteringViewConfig<TestFeed>  {.init(primaryBackground: .white,
                                                             secondaryBackground: .secondary,
                                                             primaryText: .black,
                                                             secondaryText: .gray,
                                                             feedStorage: .init(.init([])))}
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

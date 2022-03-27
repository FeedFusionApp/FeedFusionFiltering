//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension FilterType {
    public var icon: String {
        switch self {
            case .combination:
                return "list.bullet"
            case .text:
                return "textformat"
            case .feed:
                return "newspaper"
                //            case .category:
                //                return "tag.fill"
        }
    }
    
    public var name: LocalizedStringKey {
        switch self {
            case .combination:
                return "Combinator"
            case .text:
                return "Text"
            case .feed:
                return "Feed"
                //            case .category:
                //                return "Category"
        }
    }
}

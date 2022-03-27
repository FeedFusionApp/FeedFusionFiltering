//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension FeedFilterType: CaseIterable {
    public static var allCases: [FeedFilterType] = [.is, .isNot]
    
    var localized: LocalizedStringKey {
        switch self {
            case .is:
                return "is"
            case .isNot:
                return "is not"
        }
    }
}

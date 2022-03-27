//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension TextFilterKey {
    var localized: LocalizedStringKey {
        switch self {
            case .title:
                return "title"
            case .excerpt:
                return "excerpt"
            case .any:
                return "any"
        }
    }
}

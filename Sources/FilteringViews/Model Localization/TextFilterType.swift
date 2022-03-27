//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension TextFilterType {
    var localized: LocalizedStringKey {
        switch self {
            case .contains:
                return "contains"
            case .doesNotContain:
                return "doesn't contain"
            case .beginsWith:
                return "begins with"
            case .endsWith:
                return "ends with"
            case .is:
                return "is"
            case .isNot:
                return "is not"
            case .matches:
                return "matches"
        }
    }
}

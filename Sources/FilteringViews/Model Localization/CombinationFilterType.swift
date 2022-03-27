//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension CombinationFilterType {
    var localized: LocalizedStringKey {
        switch self {
            case .and:
                return "and"
            case .or:
                return "or"
            case .nand:
                return "nand"
            case .nor:
                return "nor"
        }
    }
}

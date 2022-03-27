//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public enum TextFilterType: String, Codable, CaseIterable {
    case contains
    case doesNotContain
    case beginsWith
    case endsWith
    case `is`
    case isNot
    case matches
}

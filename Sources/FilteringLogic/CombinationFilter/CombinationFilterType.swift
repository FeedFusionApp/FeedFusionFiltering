//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

public enum CombinationFilterType: String, Codable, CaseIterable {
    case and
    case or
    case nand
    case nor
}

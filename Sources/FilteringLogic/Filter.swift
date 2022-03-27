//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation
import SwiftUI

protocol Filter: Identifiable, Codable, CustomStringConvertible {
    var id: UUID { get }
    var filterType: FilterType { get }
}

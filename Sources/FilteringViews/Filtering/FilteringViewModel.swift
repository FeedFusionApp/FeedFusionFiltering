//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation
import FilteringLogic

final class FilteringViewModel: ObservableObject {
    @Published var filter: Filters
    
    init(filter: Filters) {
        self.filter = filter
    }
}

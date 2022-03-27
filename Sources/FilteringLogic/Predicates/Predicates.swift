//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import Foundation

//extension NSPredicate {
//    var not: NSPredicate {
//        NSCompoundPredicate(type: .not, subpredicates: [self])
//    }
//}
//
//public extension CombinationFilter {
//    func makePredicate() -> NSPredicate {
//        let subpredicates = children.map({ $0.makePredicate() })
//        
//        switch self.type {
//            case .and:
//                return NSCompoundPredicate(type: .and, subpredicates: subpredicates)
//            case .or:
//                return NSCompoundPredicate(type: .or, subpredicates: subpredicates)
//            case .nand:
//                return NSCompoundPredicate(type: .and, subpredicates: subpredicates).not
//            case .nor:
//                return NSCompoundPredicate(type: .or, subpredicates: subpredicates).not
//        }
//    }
//}
//
//public extension FeedFilter {
//    func makePredicate() -> NSPredicate {
//        switch type {
//            case .is:
//                return NSPredicate(format: "%K = %@", #keyPath(ArticleEntity.feed.locID), feedID)
//            case .isNot:
//                return NSPredicate(format: "%K != %@", #keyPath(ArticleEntity.feed.locID), feedID)
//        }
//    }
//}

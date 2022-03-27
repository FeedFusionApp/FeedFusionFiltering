//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

struct AddFilterButton<Feed: FilteringFeed>: View {
    let config: FilteringViewConfig<Feed>
    @ObservedObject var filter: CombinationFilter
    var nesting: Int = 0
    let maxNesting: Int = 2
    
    func addCombinator() {
        filter.children.append(.init(.combination(.and, children: [])))
        filter.objectWillChange.send()
    }
    
    func addText() {
        filter.children.append(.init(.text(.any, type: .contains, term: "")))
        filter.objectWillChange.send()
    }
    
    func addFeed() {
        filter.children.append(.init(Filters.feed(.is, feedID: nil)))
        filter.objectWillChange.send()
    }
    
//    func addCategory() {
//        filter.children.append(.category(.default, ""))
//    }
    
    func filterLabel(_ filter: FilterType) -> some View {
        HStack {
            Image(systemName: filter.icon)
                .frame(width: 30, height: 30, alignment: .center)
                .background(.regularMaterial)
                .cornerRadius(5, antialiased: true)
            Text(filter.name)
                .font(.headline)
            Spacer()
        }
    }
    
    var body: some View {
        SwiftUI.Menu {
            if nesting < maxNesting {
                Button(action: addCombinator) {
                    filterLabel(.combination)
                }
            }
            
            Button(action: addText) {
                filterLabel(.text)
            }
            
            Button(action: addFeed) {
                filterLabel(.feed)
            }
            
//            Button(action: addCategory) {
//                filterLabel(.category)
//            }
        } label: {
            Label("Add Filter", systemImage: "plus.circle.fill")
                .symbolRenderingMode(.hierarchical)
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                .background(config.primaryBackground)
                .cornerRadius(10, antialiased: true)
                .padding(.leading, 50)
        }
    }
}

struct AddFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        AddFilterButton(config: .default, filter: .init(type: .and, children: []))
    }
}

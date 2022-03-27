//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension FilteringView {
    struct CombinationFilterView<Feed: FilteringFeed>: View {
        let config: FilteringViewConfig<Feed>
        @ObservedObject var filter: CombinationFilter
        var nesting: Int = 0
        
        var body: some View {
            VStack(spacing: 5) {
                Element(config: config, filterType: filter.filterType) {
                    Spacer()
                    
                    FilteringMenu(config: config) {
                        Text(filter.type.localized)
                    } content: {
                        ForEach(CombinationFilterType.allCases, id: \.rawValue) { type in
                            Button(action: { filter.type = type }) {
                                HStack {
                                    if filter.type == type {
                                        Image(systemName: "checkmark")
                                    }
                                    Text(type.localized)
                                        .tag(type)
                                }
                            }
                        }
                    }.textCase(.uppercase)
                } collapse: {
                    EmptyView()
                }
                
                VStack(spacing: 5) {
                    ForEach(filter.children) { child in
                        HStack(alignment: .top, spacing: 0) {
                            Button(role: .destructive, action: { filter.children.removeAll(where: { $0.id == child.id }); filter.objectWillChange.send() }) {
                                Image(systemName: "multiply.circle.fill")
                                    .symbolRenderingMode(.hierarchical)
                                    .imageScale(.large)
                                    .foregroundColor(.red)
                                    .padding(5)
                                    .frame(width: 50, height: 50, alignment: .trailing)
                            }
                            FilteringView<Feed>(config: config, filter: child, nesting: nesting + 1)
                        }
                    }
                    AddFilterButton(config: config, filter: filter, nesting: nesting)
                }.background(foldingLine, alignment: .leading)
            }
        }
        
        var foldingLine: some View {
            GeometryReader { geo in
                Path { path in
                    path.move(to: CGPoint(x: 16, y: -5))
                    path.addLine(to: .init(x: 16, y: geo.size.height - 15 - 8))
                    path.addQuadCurve(to: .init(x: 16 + 8, y: geo.size.height - 15), control: .init(x: 16, y: geo.size.height - 15))
                    path.addLine(to: .init(x: 50, y: geo.size.height - 15))
                }
                .stroke(config.primaryBackground.opacity(0.8), lineWidth: 3)
            }
        }
    }
}

struct CombinationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringView<TestFeed>.CombinationFilterView(config: .default, filter: .init(type: .and, children: []))
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension FilteringView {
    struct Element<Feed: FilteringFeed, Content: View, Collapse: View>: View {
        #if os(iOS)
        @Environment(\.horizontalSizeClass) var sizeClass
        #endif
        
        let config: FilteringViewConfig<Feed>
        let filter: FilterType
        let content: Content
        let collapse: Collapse?
        
        init(config: FilteringViewConfig<Feed>, filterType: FilterType, @ViewBuilder content: () -> Content) {
            self.config = config
            self.filter = filterType
            self.content = content()
            collapse = nil
        }
        
        init(config: FilteringViewConfig<Feed>, filterType: FilterType, @ViewBuilder content: () -> Content, @ViewBuilder collapse: () -> Collapse?) {
            self.config = config
            self.filter = filterType
            self.content = content()
            self.collapse = collapse()
        }
        
#if os(iOS)
        var body: some View {
            Group {
                if sizeClass == .compact {
                    compactLayout()
                } else {
                    wideLayout()
                }
            }
            .padding(10)
            .background(backgroundMaterial)
        }
        #else
        var body: some View {
            wideLayout()
            .padding(10)
            .background(backgroundMaterial)
        }
        #endif
        
        var backgroundMaterial: some View {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundColor(config.primaryBackground)
                .frame(maxWidth: .infinity)
        }
        
        func iconAndName() -> some View {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: filter.icon)
                    .imageScale(.large)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(config.secondaryBackground)
                    .cornerRadius(12, antialiased: true)
                
                Text(filter.name)
                    .foregroundColor(config.primaryText)
                    .fontWeight(.semibold)
            }.fixedSize()
        }
        
        func wideLayout() -> some View {
            HStack(alignment: .firstTextBaseline) {
                iconAndName()
                HStack(alignment: .firstTextBaseline) {
                    content
                    if Collapse.self != EmptyView.self {
                        HStack(alignment: .firstTextBaseline) {
                            collapse
                        }
                    }
                }
            }
        }
        
        func compactLayout() -> some View {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center) {
                    iconAndName()
                    HStack(alignment: .firstTextBaseline) {
                        content
                    }
                }
                if Collapse.self != EmptyView.self {
                    HStack(alignment: .firstTextBaseline) {
                        collapse
                    }
                }
            }
        }
    }
}
//struct FilteringElement_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteringElement()
//    }
//}

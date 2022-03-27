//
//  File.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI

extension FilteringView {
    struct FilteringMenu<Feed: FilteringFeed, Label: View, Content: View>: View {
        let config: FilteringViewConfig<Feed>
        let label: Label
        let content: Content
        
        init(config: FilteringViewConfig<Feed>, @ViewBuilder label: () -> Label, @ViewBuilder content: () -> Content) {
            self.config = config
            self.label = label()
            self.content = content()
        }
        
        var body: some View {
            SwiftUI.Menu {
                content
            } label: {
                label
            }
            .padding(8)
            .frame(height: 30)
            .background(config.secondaryBackground)
            .cornerRadius(8, antialiased: true)
        }
    }
}

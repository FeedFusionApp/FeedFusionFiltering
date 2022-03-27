//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI
import FilteringLogic

extension FilteringView {
    struct TextFilterView<Feed: FilteringFeed>: View {
        let config: FilteringViewConfig<Feed>
        @ObservedObject var filter: TextFilter
        
        @State var term: String = ""
        
        @State var key: TextFilterKey = .any {
            didSet {
                filter.key = key
            }
        }
        
        @State var type: TextFilterType = .contains {
            didSet {
                filter.type = type
            }
        }
        
        func loadValues() {
            term = filter.term
            key = filter.key
            type = filter.type
        }
        
        var body: some View {
            Element(config: config, filterType: filter.filterType) {
                FilteringMenu(config: config) {
                    Text(key.localized)
                        .frame(maxWidth: .infinity)
                } content: {
                    ForEach(TextFilterKey.allCases, id: \.rawValue) { option in
                        Button(action: { key = option }) {
                            HStack {
                                if filter.key == option {
                                    Image(systemName: "checkmark")
                                }
                                Text(option.localized)
                            }
                        }
                    }
                }
                
                FilteringMenu(config: config) {
                    Text(type.localized)
                        .frame(maxWidth: .infinity)
                } content: {
                    ForEach(TextFilterType.allCases, id: \.rawValue) { option in
                        Button(action: { type = option }) {
                            HStack {
                                if filter.type == option {
                                    Image(systemName: "checkmark")
                                }
                                Text(option.localized)
                            }
                        }
                    }
                }
            } collapse: {
                TextField("Term", text: $term)
                    .foregroundColor(config.secondaryText)
                    .padding(8)
                    .frame(height: 30)
                    .background(config.secondaryBackground)
                    .cornerRadius(8, antialiased: true)
                
//                Button(action: { ignoreCase.toggle() }) {
//                    Image(systemName: "textformat.alt")
//                }
//                .tint(ignoreCase ? .accentColor : .primary)
            }
            .onAppear(perform: loadValues)
            .onChange(of: term, perform: { newValue in
                filter.term = newValue
            })
        }
    }
}

//struct TextFilterView_Previews: PreviewProvider {
//    static var previews: some View {
////        FilteringView.TextFilterView(config: .default, filter: .)
//    }
//}

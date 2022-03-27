//
//  SwiftUIView.swift
//  
//
//  Created by Noah Kamara on 27.03.22.
//

import SwiftUI

struct Background: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}

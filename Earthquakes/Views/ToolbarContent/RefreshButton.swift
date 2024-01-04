//
//  RefreshButton.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 1.01.2024.
//

import SwiftUI

struct RefreshButton: View {
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Label("Refresh", systemImage: "arrow.clockwise")
        }
        
    }
}

#Preview {
    RefreshButton()
        .previewLayout(.sizeThatFits)
}

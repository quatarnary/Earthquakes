//
//  DeleteButton.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 1.01.2024.
//

import SwiftUI

struct DeleteButton: View {
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Label("Delete", systemImage: "trash")
        }
    }
}

#Preview {
    DeleteButton()
        .previewLayout(.sizeThatFits)
}

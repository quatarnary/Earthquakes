//
//  ToolbarStatus.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 1.01.2024.
//

import SwiftUI

struct ToolbarStatus: View {
    var isLoading: Bool
    var lastUpdated: TimeInterval
    var quakesCount: Int
    
    var body: some View {
        VStack {
            if isLoading {
                Text("Checking for Earthquakes...")
                Spacer()
            } else if lastUpdated == Date.distantFuture.timeIntervalSince1970 {
                Spacer()
                Text("\(quakesCount) Earthquakes")
                    .foregroundStyle(Color.secondary)
            } else {
                let lastUpdatedDate = Date(timeIntervalSince1970: lastUpdated)
                Text("Updated \(lastUpdatedDate.formatted(.relative(presentation: .named)))")
                Text("\(quakesCount) Earthquakes")
                    .foregroundStyle(Color.secondary)
            }
        }
        .font(.caption)
    }
}

#Preview {
    Group {
        ToolbarStatus(isLoading: true, lastUpdated: Date.distantPast.timeIntervalSince1970, quakesCount: 125)
            .previewLayout(.fixed(width: 200, height: 40))
        ToolbarStatus(isLoading: false, lastUpdated: Date.distantFuture.timeIntervalSince1970, quakesCount: 10_000)
            .previewLayout(.fixed(width: 200, height: 40))
        ToolbarStatus(isLoading: false, lastUpdated: Date.now.timeIntervalSince1970, quakesCount: 10_000)
            .previewLayout(.fixed(width: 200, height: 40))
        ToolbarStatus(isLoading: false, lastUpdated: Date.distantPast.timeIntervalSince1970, quakesCount: 10_000)
            .previewLayout(.fixed(width: 200, height: 40))
    }
}

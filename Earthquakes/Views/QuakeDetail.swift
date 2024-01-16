//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 12.01.2024.
//

import SwiftUI

struct QuakeDetail: View {
    var quake: Quake
    @EnvironmentObject private var quakesProvider: QuakesProvider
    @State private var location: QuakeLocation? = nil
    
    var body: some View {
        VStack {
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted(date: Date.FormatStyle.DateStyle.long, time: Date.FormatStyle.TimeStyle.shortened))")
                .foregroundStyle(Color.secondary)
            if let location = self.location {
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
        .task {
            if self.location  == nil {
                if let quakeLocation = quake.location {
                    self.location = quakeLocation
                } else {
                    self.location = try? await quakesProvider.location(for: quake)
                }
            }
        }
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
}


//    // TODO: Trying the experiment part -failed for now
//if let location = quake.location {
////                var latitude = location.latitude.formatted(.number.precision(.fractionLength(3)))
////                var longitude = location.longitude.formatted(.number.precision(.fractionLength(3)))
////
////                var latitudeShort = latitude
////                var longitudeShort = longitude
////
////                var latitudePrecision = location.latitude
////                var longitudePrecision = location.longitude
////                Text("Latitude: \(latitude)")
////                    .onTapGesture {
////                    }
//    
//    Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
//    Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
//}

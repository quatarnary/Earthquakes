//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 12.01.2024.
//

import SwiftUI

struct QuakeDetail: View {
    var quake: Quake
    
    var body: some View {
        VStack {
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted(date: Date.FormatStyle.DateStyle.long, time: Date.FormatStyle.TimeStyle.shortened))")
                .foregroundStyle(Color.secondary)
            if let location = quake.location {
                // TODO: Trying the experiment part -failed for now
//                var latitude = location.latitude.formatted(.number.precision(.fractionLength(3)))
//                var longitude = location.longitude.formatted(.number.precision(.fractionLength(3)))
//
//                var latitudeShort = latitude
//                var longitudeShort = longitude
//                
//                var latitudePrecision = location.latitude
//                var longitudePrecision = location.longitude
//                Text("Latitude: \(latitude)")
//                    .onTapGesture {
//                    }
                
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
}

//
//  QuakeDetailMap.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 16.01.2024.
//

import SwiftUI
import MapKit

struct QuakeDetailMap: View {
    let location: QuakeLocation
    let tintColor: Color
    private var place: QuakePlace
    @State private var region = MapCameraPosition.region(MKCoordinateRegion())
    
    init(location: QuakeLocation, tintColor: Color) {
        self.location = location
        self.tintColor = tintColor
        self.place = QuakePlace(location: location)
    }
    
    var body: some View {
        // what they used in the tutorial is deprecated == Map(coordinateRegion: $region) ==
        // Hence I found a way to work it with the new Map thingy
        // Is it the best practice? God knows or someone with more knowledge knows
        // Is it working? hell yes and that is enough for me for now 😸
        Map(position: $region) {
            Marker("", coordinate: place.location)
                .tint(tintColor)
        }
            .onAppear {
                withAnimation {
                    let delta = 0.7
                    let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
                    region = MapCameraPosition.region(MKCoordinateRegion(center: place.location, span: span))
                }
            }
    }
}

struct QuakePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: QuakeLocation) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}

//#Preview {
//    QuakeDetailMap()
//}

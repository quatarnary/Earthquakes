//
//  Quake.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 1.01.2024.
//

import Foundation

struct Quake {
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
}

extension Quake: Identifiable {
    var id: String { code }
}

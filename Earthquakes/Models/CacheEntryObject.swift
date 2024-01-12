//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by Bugra Aslan on 6.01.2024.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) {
        self.entry = entry
    }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}

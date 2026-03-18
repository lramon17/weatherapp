//
//  Day.swift
//  weatherapp
//
//  Created by Lily Ramon on 3/17/26.
//

import Foundation
// create Day struct
struct Day: Identifiable {
    let id = UUID()
    let day: String
    let high: Int
    let low: Int
    let icon: String // symbol name in a string
}

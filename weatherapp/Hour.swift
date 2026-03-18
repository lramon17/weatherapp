//
//  Hour.swift
//  weatherapp
//
//  Created by Lily Ramon on 3/17/26.
//

import Foundation
// Define Hour as a struct to use in ContentView
struct Hour: Identifiable {
    let id =  UUID()
    let time: String
    var temperature: Int
    var icon: String // should be name of SF symbol as a string
}

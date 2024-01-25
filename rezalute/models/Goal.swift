//
//  Item.swift
//  rezalute
//
//  Created by Devon Bull on 1/9/24.
//

import Foundation
import SwiftData

enum ResolutionType: String, CaseIterable, Codable {
    case health = "health"
    case finances = "finances"
    case general = "general"
}

@Model
final class Goal {
    var title: String
    var about: String
    var timestamp: Date
    var type: String
    
    init(timestamp: Date, title: String = "", type: String = "general") {
        self.timestamp = timestamp
        self.title = title
        self.about = ""
        self.type = type
    }
}

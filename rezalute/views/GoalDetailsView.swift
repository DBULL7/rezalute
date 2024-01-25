//
//  GoalDetailsView.swift
//  rezalute
//
//  Created by Devon Bull on 1/10/24.
//

import SwiftUI

struct GoalDetailsView: View {
    var item: Goal
    var body: some View {
        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
    }
}

#Preview {
    let date = Date()
    let goal: Goal = Goal(timestamp: date)
    return GoalDetailsView(item: goal)
}

//
//  ContentView.swift
//  rezalute
//
//  Created by Devon Bull on 1/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationView {
            TabView {
                ManageAllResolutionsView()
                    .tabItem {
                        Label("Today", systemImage: "star")
                    }
                Text("challenge")
                    .tabItem {
                        Label("One", systemImage: "star")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Goal.self, inMemory: true)
}

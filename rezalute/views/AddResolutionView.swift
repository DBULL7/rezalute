//
//  AddResolutionView.swift
//  rezalute
//
//  Created by Devon Bull on 1/17/24.
//

import SwiftUI
import SwiftData

struct AddResolutionView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var category: String
    @State private var title: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        NavigationView {
            Form {
                TextField("Resolution Title", text: $title)
                // Additional fields
                Button("Save") {
                    saveResolution(to: category, title: title)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add New Resolution", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                // Handle cancellation logic
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveResolution(to category: String, title: String) {
        let date = Date()
        switch category {
        case "Health":
            modelContext.insert(Goal(timestamp: date, title: title, category: "health"))
        case "Financial":
            modelContext.insert(Goal(timestamp: date, title: title, category: "financial"))
        case "Other":
            modelContext.insert(Goal(timestamp: date, title: title, category: "general"))
        default:
            break
        }
    }
}

#Preview {
    @State var dummyCategory = "Health"
    return AddResolutionView(category: $dummyCategory)
}

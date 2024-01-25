//
//  AddResolutionView.swift
//  rezalute
//
//  Created by Devon Bull on 1/17/24.
//

import SwiftUI

struct AddResolutionView: View {
    @Binding var category: String
    @State private var title: String = ""
    // Other state variables as needed
    var saveAction: (String, String) -> Void
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        NavigationView {
            Form {
                TextField("Resolution Title", text: $title)
                // Additional fields
                Button("Save") {
                    saveAction(category, title)
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
}

#Preview {
    @State var dummyCategory = "Health"
    return AddResolutionView(category: $dummyCategory, saveAction: { _,_  in })
}

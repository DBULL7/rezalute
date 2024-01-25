//
//  ManageAllResolutions.swift
//  rezalute
//
//  Created by Devon Bull on 1/23/24.
//

import SwiftUI
import SwiftData

struct ManageAllResolutionsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query (filter: #Predicate<Goal> { goal in goal.category.contains("general") }) private var otherResolutions: [Goal]
    @Query (filter: #Predicate<Goal> { goal in goal.category.contains("health") }) private var healthResolutions: [Goal]
    @Query (filter: #Predicate<Goal> { goal in goal.category.contains("financial") }) private var financialResolutions: [Goal]
    
    @State private var showingAddView = false
    @State private var selectedCategory: String = ""
    @State private var showingAddItemView = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Health 💪").font(.title3).bold()) {
                    ForEach(healthResolutions, id: \.self) { resolution in
                        NavigationLink {
                            Text(resolution.title).font(.headline)
                        } label: {
                            Text(resolution.title).font(.headline)
                        }
                        
                    }
                }
                
                Section(header: Text("Financial 💸").font(.title3).bold()) {
                    ForEach(financialResolutions, id: \.self) { resolution in
                        NavigationLink {
                            Text(resolution.title).font(.headline)
                        } label: {
                            Text(resolution.title).font(.headline)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section(header: Text("General").font(.title3).bold()) {
                    ForEach(otherResolutions, id: \.self) { resolution in
                        Text(resolution.title).font(.headline)
                    }
                }
            }
            //            .environment(\.defaultMinListRowHeight, 70)
        }
        .navigationTitle("Rezalute")
        .navigationBarItems(trailing: Button(action: {
            showingAddView = true
        }) {
            Image(systemName: "plus")
        })
        
        .actionSheet(isPresented: $showingAddView) {
            ActionSheet(title: Text("Select Category"), buttons: [
                .default(Text("Health")) { selectedCategory = "Health"; showingAddItemView = true },
                .default(Text("Financial")) { selectedCategory = "Financial"; showingAddItemView = true },
                .default(Text("Other")) { selectedCategory = "Other"; showingAddItemView = true },
                .cancel()
            ])
        }
        
        .sheet(isPresented: $showingAddItemView) {
            AddResolutionView(category: $selectedCategory)
        }
    }
    
    private func showAddItemView() {
        showingAddView = true
        // Show the add item view
        // You can use a sheet or a full-screen cover depending on your design
    }
    
    
    
    private func deleteItems(at offsets: IndexSet) {
        //        withAnimation {
        //            for index in offsets {
        //                modelContext.delete(items[index])
        //            }
        //        }
    }
}

#Preview {
    NavigationView {
        ManageAllResolutionsView()
            .modelContainer(for: Goal.self, inMemory: true)
    }
}

//
//  ContentView.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View{
        Text("Home View")
        
    }
   
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

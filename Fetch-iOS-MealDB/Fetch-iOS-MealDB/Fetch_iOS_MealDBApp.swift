//
//  Fetch_iOS_MealDBApp.swift
//  Fetch-iOS-MealDB
//
//  Created by Jaswitha Reddy G on 11/1/23.
//

import SwiftUI

@main
struct Fetch_iOS_MealDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

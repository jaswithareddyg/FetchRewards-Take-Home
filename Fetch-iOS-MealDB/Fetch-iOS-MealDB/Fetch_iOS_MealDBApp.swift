//
//  Fetch_iOS_MealDBApp.swift
//  Fetch-iOS-MealDB
//
//  Created by Jaswitha Reddy G on 11/1/23.
//

import SwiftUI

@main
struct Fetch_iOS_MealDBApp: App {
var body: some Scene {
    let viewModel = MealListViewModel()
        WindowGroup {
            MealListView(mealListViewModel: viewModel)
        }
    }
}

import SwiftUI

@main
struct Fetch_iOS_MealDBApp: App {
var body: some Scene {
    let viewModel = MealListViewModel()
    
        // Define and display the primary scene of the app
        WindowGroup {
            MealListView(mealListViewModel: viewModel)
        }
    }
}

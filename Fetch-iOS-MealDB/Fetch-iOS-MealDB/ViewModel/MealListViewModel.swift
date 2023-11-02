import Foundation
import Combine

/// A ViewModel handling meal category details.
class MealListViewModel: ObservableObject {
    /// The list of meals in a category.
    @Published var meals: [MealCategory] = []
    
    /// The text used for searching meals.
    @Published var searchText: String = ""
    
    private var cancellable: AnyCancellable?

    /// Initializes the ViewModel and fetches dessert meals.
    init() {
        fetchDessertMeals()
    }

    /// Fetches dessert meals from the service.
    func fetchDessertMeals() {
        cancellable = MealService.fetchDessertMeals()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] response in
                self?.meals = response.meals.sorted(by: { $0.strMeal < $1.strMeal })
            }
    }
}

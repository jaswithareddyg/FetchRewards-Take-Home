import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var meals: [MealCategory] = []
    @Published var searchText: String = ""

    private var cancellable: AnyCancellable?

    init() {
        fetchDessertMeals()
    }

    func fetchDessertMeals() {
        MealService.fetchDessertMeals { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.meals = response.meals.sorted(by: { $0.strMeal < $1.strMeal })
                }
            case .failure(let error):
                // Handle error
                print("Error fetching dessert meals: \(error)")
            }
        }
    }
}

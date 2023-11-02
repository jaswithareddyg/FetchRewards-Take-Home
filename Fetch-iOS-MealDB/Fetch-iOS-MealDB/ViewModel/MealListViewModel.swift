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
        cancellable = MealService.fetchDessertMeals()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] response in
                self?.meals = response.meals.sorted(by: { $0.strMeal < $1.strMeal })
            }
    }
}


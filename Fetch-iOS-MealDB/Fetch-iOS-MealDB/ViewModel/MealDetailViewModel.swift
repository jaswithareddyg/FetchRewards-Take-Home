import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    @Published var selectedMeal: MealDetail?

    func fetchMealDetail(for idMeal: String) {
        MealDetailService.fetchMealDetail(for: idMeal) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.selectedMeal = response.meals.first
                }
            case .failure(let error):
                // Handle error
                print("Error fetching meal details: \(error)")
            }
        }
    }
}
